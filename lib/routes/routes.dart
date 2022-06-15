import 'dart:js';

import 'package:flutter/material.dart';
import 'package:maakview_app/view/home/home_screen.dart';
import 'package:maakview_app/view/login.dart';
import 'package:maakview_app/view/onBording.dart';
import 'package:maakview_app/view/otp/0tp_verification.dart';
import 'package:maakview_app/view/term_and_condition.dart';

class RouteManager{


  static const String logIn = '/login';
  static const String otpPage= '/otpPage';
  static const String terms = '/terms';
  static const String onBoard = '/';
  static const String home = '/home_screen';

  static Route<dynamic> generateRoute(RouteSettings settings){

    var valuePassed;

    if(settings.arguments != null){
      valuePassed = settings.arguments as Map<String,dynamic>;
    }


      switch (settings.name){

      case onBoard:
        return MaterialPageRoute(builder: (context){
          return OnBoard();
        });

      case otpPage:
        return MaterialPageRoute(builder: (context){
          return Otp(number: valuePassed['number'],);
        });

      case terms :
        return MaterialPageRoute(builder: (context){
          return Condition();
        });

        case logIn:
          return MaterialPageRoute(builder: (context){
            return MyApp();
          });
        case home:
          return MaterialPageRoute(builder: (context){
            return Home();
          });

      default:
        throw FormatException('Route not found! Check routes again!');

    }

  }


  }

