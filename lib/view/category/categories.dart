import 'package:flutter/material.dart';

class Categories extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text('categories'),
        ],
      ),
    );
  }
}
