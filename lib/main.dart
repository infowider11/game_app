import 'package:flutter/material.dart';
import 'package:gameapp/pages/matchingscreen.dart';
import 'package:gameapp/pages/new_animation_screen.dart';
import 'package:gameapp/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:  NewAnimationScreen(),
      home:  SplashScreen(),
    );
  }
}


