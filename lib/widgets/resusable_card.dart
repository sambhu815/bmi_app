import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  const ReusableCard(this.color, this.child, this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: VxBox(
        child: child,
      ).color(color).rounded.margin(Vx.m8).make(),
    );
  }
}
