import 'package:flutter/material.dart';

class MyShop extends StatelessWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text('My shop'),
        ],
      ),
    );;
  }
}
