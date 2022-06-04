import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/homepage/appbar/maakview1.svg',
                fit: BoxFit.cover,
                width: 180,
                color: Color(0xFF553eda),
              ),
            )
          ],
        ),
      ),
      body: Text('body'),
    );
  }
}
