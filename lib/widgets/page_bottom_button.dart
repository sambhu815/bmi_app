import 'package:bmi_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PageBottomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;

  const PageBottomButton({Key? key, required this.onPress, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: VxBox(child: label.text.uppercase.white.bold.xl2.make().centered())
          .width(double.infinity)
          .height(60.0)
          .margin(const EdgeInsets.only(top: 8))
          .alignCenter
          .color(kBottomContainerColor)
          .make()
          ,
    );
  }
}
