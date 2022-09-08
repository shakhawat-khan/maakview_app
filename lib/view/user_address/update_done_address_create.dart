import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http ;
import 'package:maakview_app/view/user_address/add_address.dart';

import '../bottom_navBar/bottom_nav.dart';
import 'address.dart';

class UpdateDoneAddressCreate extends StatefulWidget {


   final address;
   final city;
   final id;
   final phone;

   UpdateDoneAddressCreate({
     required this.city,
     required this.address,
     required this.id,
     required this.phone});

  @override
  State<UpdateDoneAddressCreate> createState() => _UpdateDoneAddressCreateState();
}

class _UpdateDoneAddressCreateState extends State<UpdateDoneAddressCreate> {

  Future<void>postData1() async{

    //print('in post1');
    //print(widget.id);
    //print(widget.name);
    //print(widget.email);
    //print(widget.phone);

    var body = jsonEncode({
      "id": widget.id,
      "address": widget.address,
      "city": widget.city,
      "phone": widget.phone,
    });



    http.Response response = await http.post(Uri.parse('http://v1.maakview.com/api/v1/auth/createShippingAddress_for_apps'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        },

        body: body
    );

    if(response.statusCode == 200){




      //print(response.body);
    } else {
      //print('hoy na');
      //print(response.statusCode);

      throw Exception('Failed to create album');
    }

  }

  @override
  void initState() {

    postData1();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              "assets/up_to_date/OK-GIF.gif",
              height: 150.0,
              width: 150.0,
            ),

            SizedBox(height: 25,),

            Text('Everything Is Up-To-Date',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.green
            ),),

            SizedBox(
              height: 15,
            ),

            ElevatedButton(

                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNav()),
                  );

                },
                child: Text('Back to Home'))
          ],
        ),
      ),


    );;
  }
}
