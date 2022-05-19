import 'package:bmi_app/utils/bmi_store.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeWeight extends VxMutation<BMIStore> {
  int weight;

  ChangeWeight(this.weight);

  @override
  perform() {
    store!.weight = weight;
  }
}
