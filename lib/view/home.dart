import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/view/Otp_verification.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String password = '';
  bool isChecked = false;

  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo[800],
        toolbarHeight: 148,
        title: Column(
          children: [
            Text(
              'Login/Registration',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 20.0,
              )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mobile Number',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Didn’t receive a code?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        initialSelection: 'BAN',
                        showOnlyCountryWhenClosed: false,
                      ),
                      Flexible(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration.collapsed(
                              //labelText: 'Phone Number',
                              hintText: 'Phone Number',
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.indigo,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    'I agree to the terms & condition',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 45,
                width: 355,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.indigo[900]),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Otp()));
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2,
                    width: 105.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'Or login with',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12),
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 2,
                    width: 105.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 37,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 161,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        borderOnForeground: true,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/homepage/sign_in_button_logo/Google.png'), // <-- Use 'Image.asset(...)' here
                              SizedBox(width: 5),
                              Text(
                                'Google',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 12),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Container(
                    height: 45,
                    width: 161,
                    child: InkWell(
                      onTap: () {
                        //print('hello');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        borderOnForeground: true,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/homepage/sign_in_button_logo/facebook.png'), // <-- Use 'Image.asset(...)' here
                              SizedBox(width: 5),
                              Text(
                                'Facebook',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 12),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
