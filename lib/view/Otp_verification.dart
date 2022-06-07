import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp extends StatelessWidget {
  String number;

  Otp({required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.indigo[800],
          toolbarHeight: 148,
          title: Column(
            children: [
              Text(
                'OTP Verification',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Please enter the Verification code sent to',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300)),
              ),
            ),
            Text(
              number,
              style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
              ),
            )
          ],
        ));
  }
}
