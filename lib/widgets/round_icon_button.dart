import 'package:bmi_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  IconData icon;
  VoidCallback onPressed;

  RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: const CircleBorder(),
        fillColor: kRoundIconButtonColor,
        onPressed: onPressed,
        elevation: 8,
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        child: Icon(icon));
  }
}
