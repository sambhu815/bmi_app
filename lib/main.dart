import 'package:bmi_app/error.dart';
import 'package:bmi_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'utils/bmi_store.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorPage(errorException: details.exception.toString());
  };

  runApp(VxState(
      store: BMIStore(),
      interceptors: [LogInterceptor()],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: const Color(0xFF0F0F1E)),
      home: const Home(),
    );
  }
}
