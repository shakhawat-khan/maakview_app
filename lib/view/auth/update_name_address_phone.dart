import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/auth/update_done_screen.dart';
import 'package:provider/provider.dart';

import '../../model/home/auth/response_post_phone_number.dart';
import 'package:http/http.dart' as http;




class UpdateInfo extends StatefulWidget {

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Consumer<LoginToHome>(
      builder: (context,value,child){


        return   FutureBuilder<ResponsePostNumber>(
            future: value.getData(),
            builder: (context,snapshot){

              final data = snapshot.data;

              if(snapshot.hasData){
                return buildForm(data!,context);

                //Text(snapshot.data!.user.email);
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return  SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      // you can replace this with Image.asset
                      'assets/app_logo/app_logo_1.png',
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                    // you can replace
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
                      strokeWidth: 1,
                    ),
                  ],
                ),
              );


            }

        );
      },

    );
  }

  buildForm(ResponsePostNumber responsePostNumber, BuildContext context){

    final data = responsePostNumber.user;

    String name = '';

    String email ='kkk' ;

    String number = '' ;

    TextEditingController textFieldController1 = TextEditingController(text: data.name);
    TextEditingController textFieldController2 = TextEditingController(text: data.email);
    TextEditingController textFieldController3 = TextEditingController(text: data.phone);



    return Scaffold(
      appBar: AppBar(
        title: Text('Update Info'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [

                SizedBox(height: 20,),


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

                SizedBox(height: 20,),

               /* Container(
                  child: formField(data.name,'Name','mr.abc',Icon(Icons.abc,color: Colors.indigo),TextInputType.text,name ,formKey1 ),

                  width: MediaQuery.of(context).size.width,
                ),*/

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: textFieldController1,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.abc_rounded,color: Colors.indigo,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),


                SizedBox(height: 20,),

               /* Container(
                  child: formField(data.email,'Email','name@example.com',Icon(Icons.email_outlined,color: Colors.indigo,),TextInputType.emailAddress,email,formKey2),

                  width: MediaQuery.of(context).size.width,
                ),*/

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: textFieldController2,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email,color: Colors.indigo,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),


                SizedBox(height: 20,),


                /*Container(
                  child: formField(data.phone,'Phone Number','01*********',Icon(Icons.phone,color: Colors.indigo,),TextInputType.number,number,formKey3),

                  width: MediaQuery.of(context).size.width,
                ),
*/


                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: textFieldController3,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(Icons.phone_android,color: Colors.indigo,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),




                SizedBox(height: 35,),


                ElevatedButton(
                    onPressed: (){


                      print(email);
                      print(name);
                      print(number);


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  UpdateDone(
                          id: data.id.toString(),
                          name:textFieldController1.text ,
                          email: textFieldController2.text,
                          phone: textFieldController3.text,

                        )),
                      );

                      //print(name);
                      //print(number);
                      //print('i am here');
                  //postData1();


                    },
                    child:Text('Update')
                ),


              ],
            ),
          ),
        ],
      ),
    )

  }

  Widget formField(String initial ,String label,String hint,Icon icon,TextInputType textInputType, String valueString , GlobalKey globalKey ) {

        return TextFormField(
          initialValue: initial ,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(),
            prefixIcon: icon,
          ),
          keyboardType: textInputType,

          onSaved: (String ? value) {

           //print('value er moddhe asche');

            setState(() {
              valueString = value.toString();
              //print(value);
              //print(valueString);

            });

          },
        );



  }

}
