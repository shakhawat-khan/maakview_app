import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/login.dart';
import 'package:provider/provider.dart';

import '../../../model/home/auth/response_post_phone_number.dart';
import '../../../services/shared_preferences_service.dart';
import '../../../view/auth/update_name_address_phone.dart';
import '../../../view/onBording.dart';


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
    PrefService _perfService = PrefService();

    return Consumer<LoginToHome>(
      builder: (context,value,child){
        return Drawer(
          //backgroundColor: Colors.indigo,
          child: Column(
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
                          Text('Name  ',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),
                          Flexible(child: Text(data.name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),)),
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
              ),




              ListTile(
                hoverColor: Colors.blue,
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                leading: Icon(
                  Icons.local_offer,
                  color: Colors.indigo,
                ),
                title: Text('Offers',style: TextStyle(fontSize: 15),),
                onTap: () {},
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                hoverColor: Colors.blue,
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text('Favorites',style: TextStyle(fontSize: 15),),
                onTap: () { },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                hoverColor: Colors.blue,
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                leading: Icon(
                  Icons.history,
                  color: Colors.indigo,
                ),
                title: Text('Order history',style: TextStyle(fontSize: 15),),
                onTap: () {},
              ),
              Divider(
                color: Colors.grey,
              ),



              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    hoverColor: Colors.blue,
                    dense: true,
                    visualDensity: VisualDensity(vertical: -4),
                    leading: Icon(
                      Icons.logout,
                      color: Colors.indigo,
                    ),
                    title: Text('Logout',style: TextStyle(fontSize: 15)),
                    onTap: () async{

                     _perfService.removeCache('password').whenComplete((){

                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => MyApp()),
                       );


                     });


                    },
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              )

            ],
          ),
        );
      },
    );

  }

}
