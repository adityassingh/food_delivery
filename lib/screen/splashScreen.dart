import 'dart:async';

import 'package:flutter_app/main.dart';
import 'package:flutter_app/screen/animationScreen.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnimationScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xff4357F4), Color(0xff21BDD6), Color(0xff1EB0BF)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      backgroundColor: Color(0xff1F2022),
      body: SafeArea(
        child: Center(
          child: Container(
              child: Image.asset('assets/icon/icon.jpg'), width: width / 0.7),
        ),
      ),
    );
  }
}
