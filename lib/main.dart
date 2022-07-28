import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/provider/add_cart.dart';
import 'package:maakview_app/provider/otp_varification_provider.dart';
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
    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (context)=> CartProvider() ),
      ChangeNotifierProvider(create: (context)=>OtpVerification()),

    ],

      child: MaterialApp(

        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),


          radioTheme: RadioThemeData(

          ),
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

