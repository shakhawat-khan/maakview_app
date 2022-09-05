import 'package:flutter/material.dart';
import 'package:maakview_app/view/user_address/address.dart';

import '../bottom_navBar/bottom_nav.dart';

import 'package:http/http.dart' as http ;

class DeleteAddress extends StatefulWidget {


   final userId;
   final addressId;

   DeleteAddress({required this.userId,required this.addressId});

  @override
  State<DeleteAddress> createState() => _DeleteAddressState();
}

class _DeleteAddressState extends State<DeleteAddress> {
   Future<void> deleteData()async{
     http.Response response;

     response = await http.get(Uri.parse('http://v1.maakview.com/api/v1/auth/deleteShippingAddress_for_apps/${widget.userId}/${widget.addressId}'));
   }

   @override
  void initState() {
     deleteData();
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
