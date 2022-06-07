import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/utils/term_and_condition_font.dart';

class Condition extends StatelessWidget {
  const Condition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo[800],
        toolbarHeight: 148,
        title: Column(
          children: [
            Text(
              'Terms & Condition',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(23, 52, 17, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KtextFontHeadline(text: '1. Using Our Service'),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies cursus porta potenti dis malesuada sagittis, sit diam. Sagittis et tellus vel, facilisi rhoncus. Sit quis viverra pretium eu adipiscing justo leo, eget. Sit urna quis ut dolor. Lectus in aliquet',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              KtextFontHeadline(text: '2. Seller'),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies cursus porta potenti dis malesuada sagittis, sit diam. Sagittis et tellus vel, facilisi rhoncus. Sit quis viverra pretium eu adipiscing justo leo, eget. Sit urna quis ut dolor. Lectus in aliquet',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              KtextFontHeadline(text: '3. Delivery Policy'),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies cursus porta potenti dis malesuada sagittis, sit diam. Sagittis et tellus vel, facilisi rhoncus. Sit quis viverra pretium eu adipiscing justo leo, eget. Sit urna quis ut dolor. Lectus in aliquet',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              KtextFontHeadline(text: '4. Return Policy'),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies cursus porta potenti dis malesuada sagittis, sit diam. Sagittis et tellus vel, facilisi rhoncus. Sit quis viverra pretium eu adipiscing justo leo, eget. Sit urna quis ut dolor. Lectus in aliquet',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
