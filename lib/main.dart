import 'package:flutter/material.dart';

import 'view/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
