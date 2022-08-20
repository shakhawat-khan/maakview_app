

import 'package:flutter/material.dart';
import 'package:maakview_app/view/bottom_navBar/bottom_nav.dart';
import 'package:maakview_app/view/home/home_screen.dart';
import 'package:maakview_app/view/login.dart';
import 'package:maakview_app/view/onBording.dart';
import 'package:maakview_app/view/otp/0tp_verification.dart';
import 'package:maakview_app/view/payment/Bkash.dart';
import 'package:maakview_app/view/payment/cash_on_delivery.dart';
import 'package:maakview_app/view/payment/payment.dart';
import 'package:maakview_app/view/term_and_condition.dart';

import '../controller/home/view_all_categories.dart';

import '../model/home/viewall_categoreis_model.dart';
import '../view/details_most_popular_data/details_data.dart';
import '../view/orders/orders.dart';
import '../view/payment/payment.dart';
import '../view/pos/pos.dart';
import '../view/splash_screen/splash.dart';



class RouteManager  {
  static const String logIn = '/login';
  static const String otpPage= '/otpPage';
  static const String terms = '/terms';
  static const String onBoard = '/';
  static const String home = '/home_screen';
  static const String bottom_nav = '/bottom-nav';
  static const String view_all_categories = '/view_all_categories';
  static const String payment = '/payment';
  static const String pos = '/pos';
  static const String cash_on_delivery = '/cash_on_delivery';
  static const String bkash = '/bkash';
  static const String most_popular_product_details = '/most_popular_product_details';
  static const String order = '/order';
  static const String splash = '/splash';




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
          return Otp(number: valuePassed['number'] );
        });

      case terms :
        return MaterialPageRoute(builder: (context){
          return Condition();
        });

      case logIn:
        return MaterialPageRoute(builder: (context){
          return MyApp();
        });

      case view_all_categories:
        return MaterialPageRoute(builder: (context){
          return Categories();
        });

      case home:
        return MaterialPageRoute(builder: (context){
          return BottomNav();
        });

      case splash:
        return MaterialPageRoute(builder: (context){
          return SplashView();
        });


      /*case payment_class:
        return MaterialPageRoute(builder: (context){
          return Payment();
        });*/

      case payment:
        return MaterialPageRoute(builder: (context){
          return Payment();
        });

      case pos:
        return MaterialPageRoute(builder: (context){
          return Pos();
        });

      case cash_on_delivery:
        return MaterialPageRoute(builder: (context){
          return CashOnDelivery();
        });

      case bkash:
        return MaterialPageRoute(builder: (context){
          return Bkash();
        });

      case most_popular_product_details:
        return MaterialPageRoute(builder: (context){
          return DetailsData(slug: valuePassed['slug']);
        });

        case order:
        return MaterialPageRoute(builder: (context){
          return Orders();
        });



      default:
        throw FormatException('Route not found! Check routes again!');

    }

  }



}

