import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/routes.dart';
import 'lib/routes/routes.dart';

class Otp extends StatefulWidget {
  String number;


  Otp({required this.number});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  int start = 30;
  Color border = Colors.black;
  int counterOtp=0;
  bool wait = true;
  TextEditingController _controller1 = TextEditingController();
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();
  final fieldText4 = TextEditingController();

  void cleanText(){
    fieldText1.clear();
    fieldText2.clear();
    fieldText3.clear();
    fieldText4.clear();
  }

  void startTimer()
  {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if(start==0){

        setState(() {
          timer.cancel();
          wait = false;

        });

      }else{
        setState(() {
          start--;
        });
      }
    });

  }



  @override
  void initState() {

    startTimer();

    super.initState();

  }

  @override
  void dispose() {
    startTimer();

    super.dispose();
  }


  final formKey = GlobalKey<FormState>();

  String otp_code = '1234';

  @override
  Widget build(BuildContext context) {

    //print('hello');

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.indigo[800],
          toolbarHeight: 148,
          flexibleSpace:Image(image: AssetImage('assets/appbar_back/new_backlogo.png'),

            fit: BoxFit.none,) ,



          title: Column(
            children: [

              Text(
                'OTP Verification',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                    )),
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
              '+880'+widget.number,
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
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3

                    )
                ),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textFieldOTP(first: true, last: false,code:otp_code[0],test: fieldText1 ),
                  _textFieldOTP(first: false, last: false,code:otp_code[1] ,test: fieldText2),
                  _textFieldOTP(first: false, last: false,code:otp_code[2],test: fieldText3 ),
                  _textFieldOTP(first: false, last: true,code:otp_code[3] ,test: fieldText4),

                ],
              ),

            ),

            SizedBox(height: 10,),


            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Wait for  ',
                  style: TextStyle(
                    fontSize: 16,
                      color: Colors.grey
                  ),

                ),
                TextSpan(
                  text: '00:$start',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                  ),

                ),
                TextSpan(
                  text: ' sec',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),

                ),
              ]
            )),



            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: (){
                  //print(counterOtp);


                 /* Fluttertoast.showToast(msg: counterOtp==4? 'correct': 'Incorrect, please try again' ,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.grey,

                  );

                  setState(() {
                    counterOtp = 0;
                  });

                  cleanText();*/

                  if(counterOtp==4){
                    Fluttertoast.showToast(msg: 'correct' ,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.grey);
                    setState(() {
                      counterOtp = 0;
                    });
                    cleanText();

                    Navigator.of(context).pushNamed(RouteManager.home);



                  } else{
                        Fluttertoast.showToast(msg: 'Incorrect' ,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.grey);
                        setState(() {
                          counterOtp = 0;
                        });
                        cleanText();
                    }


                },
                child: Text( 'Check OTP') ),


            SizedBox(height: 10,),


            Container(
                child: wait? //check if loading is true or false
                Container(
                  child: Text(''),
                )  : //show progress on loading = true
                InkWell(
                  onTap: (){
                    //Navigator.pop(context);
                    setState(() {
                      start=30;
                      startTimer();
                      wait = true;

                    });
                  },
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.poppins(
                        textStyle:
                        TextStyle(fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3

                        )
                    ),
                  ),
                ), //show this text on loading = false
            ),



          ]
        ));
  }

  Widget _textFieldOTP({required bool first, last,required String code,required TextEditingController test }) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextFormField(

          controller: test,

          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 ) {
              FocusScope.of(context).nextFocus();
              if(value == code){
                setState(() {
                  counterOtp = counterOtp+1;
                });
              }

            }
          },

          validator: (value){
            if(value==null || value != code){
              return "ERROR";
            }
            else {
              null;
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
