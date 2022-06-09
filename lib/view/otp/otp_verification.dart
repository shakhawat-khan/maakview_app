import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class Otp extends StatefulWidget {
  String number;

  Otp({required this.number});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  Color border = Colors.black;

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
              widget.number,
              style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                'Change Number',
                style: GoogleFonts.poppins(
                    textStyle:
                    TextStyle(fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,)
                ),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textFieldOTP(first: true, last: false),
                  _textFieldOTP(first: false, last: false),
                  _textFieldOTP(first: false, last: false),
                  _textFieldOTP(first: false, last: true),

                ],
              ),
            )

          ]
        ));
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
          },
          showCursor: true ,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.indigo),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

}
