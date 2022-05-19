import 'package:bmi_app/utils/bmi_store.dart';
import 'package:bmi_app/utils/constants.dart';
import 'package:bmi_app/utils/sex.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeGender extends VxMutation<BMIStore> {
  final Sex sex;

  ChangeGender(this.sex);

  @override
  perform() {
    store!.sex = sex;
    if (sex == Sex.Male) {
      store!.maleCardColor = kActiveCardColor;
      store!.femaleCardColor = kInactiveCardColor;
    } else {
      store!.maleCardColor = kInactiveCardColor;
      store!.femaleCardColor = kActiveCardColor;
    }
  }
}
