import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IconContent extends StatelessWidget {
  String label;
  IconData icon;

  IconContent({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
        [
          Icon(
            icon,
            size: 80.0,
          ),
          8.heightBox,
          label.text.uppercase.gray500.xl.make()
        ]).p8();
  }
}
