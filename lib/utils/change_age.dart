import 'package:bmi_app/utils/bmi_store.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeAge extends VxMutation<BMIStore> {
  int age;

  ChangeAge(this.age);

  @override
  perform() {
    store!.age = age;
  }
}
