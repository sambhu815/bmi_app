import 'package:bmi_app/utils/constants.dart';
import 'package:bmi_app/utils/sex.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BMIStore extends VxStore {
  int height = 180;
  int weight = 60;
  int age = 20;
  Sex sex = Sex.Male;
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  @override
  String toString() {
    return 'BMIStore{height: $height, weight: $weight, age: $age, sex: $sex}';
  }
}

class LogInterceptor extends VxInterceptor {
  @override
  void afterMutation(VxMutation<VxStore?> mutation) {
    print("Current state -${mutation.store.toString()}");
  }

  @override
  bool beforeMutation(VxMutation<VxStore?> mutation) {
    print("Previous state - ${mutation.store.toString()}");
    return true;
  }
}
