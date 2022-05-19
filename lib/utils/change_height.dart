import 'package:bmi_app/utils/bmi_store.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeHeight extends VxMutation<BMIStore> {
  final int height;

  ChangeHeight(this.height);

  @override
  perform() {
    store!.height = height;
  }
}
