import 'package:api_practice/Day_Three.dart';
import 'package:api_practice/Day_Two.dart';
import 'package:api_practice/day6.dart';
import 'package:api_practice/splash_Screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.dark,
      home:  SplashScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}
