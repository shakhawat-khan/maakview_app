import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/routes.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height:30 ,),

              Image.asset('assets/onBoarding_screen/maakview_logo.png'),
              SizedBox(height: 30,),
              Container(
                  height: 240,
                  width: 340,
                  child: Image.asset('assets/onBoarding_screen/logo.png')),

              SizedBox(height: 50,),

              Container(
                alignment: Alignment.center,
                child: Text('No investment, for business!',style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ))),
              ),

              Container(
                alignment: Alignment.center,
                child:Text('No Cash? No Shop? No Delivery System?',style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w200
                    ))),
              ),

              Container(
                alignment: Alignment.center,
                child:Text('We will help you to grow your business',style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w200
                    ))),
              ),

              SizedBox(height:30 ,),

              Container(
                height: 40,
                width: 345,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.indigo[900]),
                  onPressed: () {

                    Navigator.of(context).pushNamed(RouteManager.homePage);

                  },
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),


            ],
          ),
        )

      ),
    );
  }
}
