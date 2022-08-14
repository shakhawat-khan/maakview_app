import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:provider/provider.dart';

import '../../../model/home/auth/response_post_phone_number.dart';
import '../../../view/auth/update_name_address_phone.dart';


class ResponseNumber extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    Future<ResponsePostNumber>? _futureAlbum;

    return Consumer<LoginToHome>(
      builder: (context,value,child){
          return   FutureBuilder<ResponsePostNumber>(
              future: value.getData(),
              builder: (context,snapshot){

                final data = snapshot.data;

                if(snapshot.hasData){
                  return buildAuth(data!,context);

                  //Text(snapshot.data!.user.email);
                }
                else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator(color: Colors.transparent,);


              }

          );
      },

    );
  }

  buildAuth(ResponsePostNumber responsePostNumber , BuildContext context){
    final data = responsePostNumber.user;

    return Consumer<LoginToHome>(
      builder: (context,value,child){
        return Drawer(
          //backgroundColor: Colors.indigo,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(

                child:InkWell(
                  onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  UpdateInfo()),
                    );

                  },
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png'),
                            fit: BoxFit.cover,

                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text('Name  '),
                          Text(data.name),
                        ],
                      ),

                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                ),
              ),
              ListTile(
                title: Text(data.id.toString()),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(data.email),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );

  }

}
