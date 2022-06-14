import 'package:flutter/material.dart';
import 'package:maakview_app/routes/routes.dart';
import 'package:maakview_app/view/otp/0tp_verification.dart';

import 'view/home.dart';

void main() {
  const color1 = const Color(0xffb74093);
  runApp(MaterialApp(

    theme: ThemeData(

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo ,
      ),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: RouteManager.onBoard,
    onGenerateRoute: RouteManager.generateRoute,

  ));
}
