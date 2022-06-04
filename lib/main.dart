import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'view/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splash: SvgPicture.asset('assets/splash_screen/splash_logo.svg'),
      splashIconSize: 100,
      duration: 2000,
      nextScreen: MyApp(),
    ),
  ));
}
