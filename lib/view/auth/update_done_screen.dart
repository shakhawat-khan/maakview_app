import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maakview_app/view/home/home_screen.dart';

import 'package:http/http.dart' as http ;

import '../bottom_navBar/bottom_nav.dart';



class UpdateDone extends StatefulWidget {
  final id;

  final name;

  final email;

  final phone;





  UpdateDone({required this.id,required this.name, required this.email,required this.phone});

  @override
  State<UpdateDone> createState() => _UpdateDoneState();
}

class _UpdateDoneState extends State<UpdateDone> {





  Future<void>postData1() async{

    //print('in post1');
    //print(widget.id);
    //print(widget.name);
    //print(widget.email);
    //print(widget.phone);

    var body = jsonEncode({
      "id": widget.id,
      "name": widget.name,
      "email": widget.email,
      "phone": widget.phone,
    });



    http.Response response = await http.post(Uri.parse('https://v1.maakview.com/api/v1/auth/user_info_update'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      },

      body: body
    );

    if(response.statusCode == 200){


      print(response.body);
    } else {
      //print('hoy na');
      //print(response.statusCode);

      throw Exception('Failed to create album');
    }

  }

  @override
  void initState() {

    postData1();
    print('hello');

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


    );
  }
}
