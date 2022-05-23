import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ErrorPage extends StatelessWidget {
  final String errorException;

  const ErrorPage({Key? key, required this.errorException}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Error Screen".text.white.make().centered(),
      ),
      body: SafeArea(
        child: Center(
          child: errorException.text.make(),
        ),
      ),
    );
  }
}
