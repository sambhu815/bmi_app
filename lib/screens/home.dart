import 'package:bmi_app/screens/result_page.dart';
import 'package:bmi_app/utils/bmi_calculator.dart';
import 'package:bmi_app/utils/bmi_store.dart';
import 'package:bmi_app/utils/change_age.dart';
import 'package:bmi_app/utils/change_gender.dart';
import 'package:bmi_app/utils/change_height.dart';
import 'package:bmi_app/utils/change_weight.dart';
import 'package:bmi_app/utils/constants.dart';
import 'package:bmi_app/utils/sex.dart';
import 'package:bmi_app/widgets/icon_content.dart';
import 'package:bmi_app/widgets/page_bottom_button.dart';
import 'package:bmi_app/widgets/resusable_card.dart';
import 'package:bmi_app/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = VxState.store as BMIStore;
    return Scaffold(
      appBar: AppBar(
        title:
            "BMI Calculator App".text.uppercase.white.bold.xl.make().centered(),
      ),
      body: VStack(
          crossAlignment: CrossAxisAlignment.stretch,
          alignment: MainAxisAlignment.center,
          [
            VxBuilder(
                builder: (context, _, status) => HStack([
                      ReusableCard(store.maleCardColor,
                          IconContent(icon: Icons.male_rounded, label: "male"),
                          () {
                        ChangeGender(Sex.Male);
                      }).expand(),
                      ReusableCard(
                          store.femaleCardColor,
                          IconContent(
                              label: "female", icon: Icons.female_rounded), () {
                        ChangeGender(Sex.Female);
                      }).expand()
                    ]),
                mutations: const {ChangeGender}).expand(),
            HStack(
              [
                VxBuilder(
                    builder: (context, _, status) => ReusableCard(
                        kActiveCardColor,
                        VStack([
                          "Height".text.uppercase.xl.gray500.make().centered(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              store.height
                                  .toString()
                                  .text
                                  .xl4
                                  .white
                                  .bold
                                  .make(),
                              "cm".text.gray500.make(),
                            ],
                          ),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 15.0),
                                  overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 30.0),
                                  thumbColor: Colors.deepOrange,
                                  overlayColor: Colors.deepOrange.shade900,
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Colors.grey),
                              child: Slider(
                                value: store.height.toDouble(),
                                max: 250.0,
                                min: 100.0,
                                divisions: (250.0 - 100.0).toInt(),
                                onChanged: (double newValue) =>
                                    ChangeHeight(newValue.toInt()),
                              ))
                        ]).centered(),
                        () {}),
                    mutations: const {ChangeHeight}).expand()
              ],
            ).expand(),
            HStack([
              VxBuilder(
                  builder: (context, _, status) => ReusableCard(
                          kActiveCardColor,
                          VStack(
                              alignment: MainAxisAlignment.center,
                              crossAlignment: CrossAxisAlignment.center,
                              [
                                "weight".text.uppercase.gray500.xl.make(),
                                store.weight
                                    .toString()
                                    .text
                                    .xl6
                                    .white
                                    .bold
                                    .make(),
                                HStack(alignment: MainAxisAlignment.center, [
                                  RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () =>
                                          ChangeWeight(store.weight + 1)),
                                  10.widthBox,
                                  RoundIconButton(
                                      icon: Icons.remove,
                                      onPressed: () =>
                                          ChangeWeight(store.weight - 1))
                                ]).centered()
                              ]).expand().centered(),
                          () {})
                      .expand(),
                  mutations: const {ChangeWeight}),
              VxBuilder(
                  builder: (context, _, status) => ReusableCard(
                          kActiveCardColor,
                          VStack(
                              crossAlignment: CrossAxisAlignment.center,
                              alignment: MainAxisAlignment.center,
                              [
                                "age".text.uppercase.gray500.xl.make(),
                                store.age.toString().text.white.xl6.bold.make(),
                                HStack(alignment: MainAxisAlignment.center, [
                                  RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () =>
                                          ChangeAge(store.age + 1)),
                                  10.widthBox,
                                  RoundIconButton(
                                      icon: Icons.remove,
                                      onPressed: () => ChangeAge(store.age - 1))
                                ])
                              ]).expand().centered(),
                          () {})
                      .expand(),
                  mutations: const {ChangeAge})
            ]).expand(),
            PageBottomButton(
                onPress: () {
                  final calc =
                      BMICalculator(height: store.height, weight: store.weight);
                  final bmi = calc.calculate();
                  final result = calc.getResult();
                  final interpretation = calc.getInterpreparation();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: bmi,
                          result: result,
                          interpretation: interpretation,
                        ),
                      ));
                },
                label: "calculate")
          ]),
    );
  }
}
