import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maakview_app/routes/routes.dart';


import '../../services/shared_preferences_service.dart';
import '../bottom_navBar/bottom_nav.dart';
import '../onBording.dart';

class SplashView extends StatefulWidget {
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  final PrefService _prefService = PrefService();

  @override
  void initState() {
    _prefService.readCache("password").then((value) {
      //print(value.toString());
      if (value != null) {
        return Timer(Duration(seconds: 3),
                () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context, )=>BottomNav()
                )));
      } else {
        return Timer(Duration(seconds: 3),
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoard()),
                ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
            child: Image.asset('assets/app_logo/app_logo_1.png',height: 100,width: 100,),
          )
      );

  }
}