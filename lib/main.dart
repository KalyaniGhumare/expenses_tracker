import 'package:flutter/material.dart';
import 'package:flutter_widget/intro/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: SplashScreen());
  }
}
