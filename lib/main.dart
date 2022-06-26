import 'package:flutter/material.dart';
import 'package:maakview_app/provider/add_cart.dart';
import 'package:maakview_app/routes/routes.dart';
import 'package:maakview_app/view/otp/0tp_verification.dart';
import 'package:provider/provider.dart';

import 'view/login.dart';

void main() {
  const color1 = const Color(0xffb74093);
  runApp( Test());
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),

      child: MaterialApp(

        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo ,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.home,
        onGenerateRoute: RouteManager.generateRoute,

      ),
    );
  }
}

