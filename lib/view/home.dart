import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String password = '';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  checkColor: Colors.white,
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
                onPressed: () {},
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
            Text(
              'Or login with',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 12),
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 37,
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
