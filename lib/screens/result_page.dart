import 'package:bmi_app/utils/constants.dart';
import 'package:bmi_app/widgets/resusable_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  const ResultPage(
      {Key? key,
      required this.bmi,
      required this.result,
      required this.interpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "bmi result".text.white.bold.make(),
      ),
      body: VStack(
          alignment: MainAxisAlignment.spaceEvenly,
          crossAlignment: CrossAxisAlignment.stretch,
          [
            "Your Results"
                .text
                .white
                .size(50.0)
                .bold
                .make()
                .pOnly(top: 10.0, left: 10.0)
                .box
                .make()
                .centered()
                .expand(),
          ]),
    );
  }
}
