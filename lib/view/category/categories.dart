import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
