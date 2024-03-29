
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/otp/0tp_verification.dart';
import 'package:maakview_app/view/term_and_condition.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routes/routes.dart';
import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/shared_preferences_service.dart';

import 'dart:math';


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();

}

class MyAppState extends State<MyApp> with ChangeNotifier {

  final formKey = GlobalKey<FormState>();

  String password = '';
  bool isChecked = false;
  String phoneNumber = '';
  String sharePref = '';
  bool wait = false;
  //final Uri _url = Uri.parse('https://maakview.com/otp/1234/01557038556');


  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);

  Random random = Random();
  String savedText = '';
  PrefService _perfService = PrefService();

  addStringToSF(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', number);
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('stringValue');
    return stringValue;
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        //backgroundColor: Colors.indigo[800],
        toolbarHeight: 138,
        automaticallyImplyLeading: false,
        /*flexibleSpace:Image(image: AssetImage('assets/appbar_back/new_backlogo.png'),

            fit: BoxFit.cover,) ,*/



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

                ],
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        initialSelection: '+880',
                        favorite: ['+880'],
                        showCountryOnly: true,
                        showDropDownButton: false,
                        showOnlyCountryWhenClosed: false,
                      ),
                      Flexible(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              //border: OutlineInputBorder(),
                              //labelText: 'Phone Number',
                              hintText: 'Phone Number',
                            ),
                            validator: (value) {
                              if (value == null || value.length < 9) {
                                phoneNumber = value!;
                                //print('hello');
                                return 'Enter at least 10 digits';
                              } else
                                null;
                            },
                            onChanged: (value) async{

                              setState(() {
                                phoneNumber = value.toString();

                                //print(value);
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  setState(() {
                    isChecked = true;
                  });
                },

                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'I agree to the',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          )),
                        ),
                        InkWell(
                          onTap: () {
                            /*Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Condition()));*/

                            Navigator.of(context).pushNamed(RouteManager.terms);

                          },
                          child: Text(
                            ' terms & condition',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2)),
                          ),
                        ),

                        Text(' of Maakview'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 45,
                width: 355,
                child: Consumer<LoginToHome>(
                  builder: (context,value,child){

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.indigo[900]),
                      onPressed: () async{
                        if (isChecked == false ||
                            formKey.currentState!.validate() == false) {
                          //print('error');
                        } else {
                          //phoneNumber = value!;
                          //Navigator.of(context).push(MaterialPageRoute(
                          //  builder: (context) => Otp(number: phoneNumber)));
                          //print(phoneNumber);

                          addStringToSF(phoneNumber);
                          value.catchNumber(await getStringValuesSF());

                          Navigator.of(context).pushNamed(RouteManager.otpPage,arguments:

                          {'number': await getStringValuesSF(),},

                          );
                        };

                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 12),
                            fontWeight: FontWeight.w500),
                      ),
                    );

                  },

                ),
              ),
              SizedBox(
                height: 26,
              ),
              /*Row(
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
              ),*/
              SizedBox(
                height: 37,
              ),
             /* Row(
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
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
