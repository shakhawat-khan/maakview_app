
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/view/otp/0tp_verification.dart';
import 'package:maakview_app/view/term_and_condition.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String password = '';
  bool isChecked = false;
  String phoneNumber = '';


  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo[800],
        toolbarHeight: 148,
        flexibleSpace:Image(image: AssetImage('assets/appbar_back/new_backlogo.png'),

            fit: BoxFit.none,) ,



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
                        initialSelection: 'BAN',
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
                              if (value == null || value.length < 11) {
                                phoneNumber = value!;
                                //print('hello');
                                return 'Enter at least 10 digits';
                              } else
                                null;
                            },
                            onChanged: (value) {
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
                      checkColor: Colors.indigo,
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Condition()));
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
                        )
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.indigo[900]),
                  onPressed: () {
                    if (isChecked == false ||
                        formKey.currentState!.validate() == false) {
                      //print('error');
                    } else {
                      //phoneNumber = value!;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Otp(number: phoneNumber)));
                      print(phoneNumber);
                    }
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
