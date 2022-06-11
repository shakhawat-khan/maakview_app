import 'package:flutter/material.dart';

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
    home: MyApp(),
  ));
}
