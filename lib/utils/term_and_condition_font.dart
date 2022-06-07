import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KtextFontHeadline extends StatelessWidget {
  String text;

  KtextFontHeadline({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 16,
        color: Colors.deepPurple,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}
