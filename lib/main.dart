import 'package:bmi_calculator/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 11, 15, 31)),
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
