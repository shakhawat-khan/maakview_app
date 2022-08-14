import 'package:flutter/material.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/auth/update_done_screen.dart';
import 'package:provider/provider.dart';

import '../../model/home/auth/response_post_phone_number.dart';

class UpdateInfo extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String number = '';


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

              return  Transform.scale(
                scale: .2,
                child: CircularProgressIndicator(
                  strokeWidth: 10.0,
                ),
              );


            }

        );
      },

    );
  }

  buildForm(ResponsePostNumber responsePostNumber, BuildContext context){

    final data = responsePostNumber.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Info'),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Padding(
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

                  Container(
                    child: formField(data.name,'Name','mr.abc',Icon(Icons.abc,color: Colors.indigo),TextInputType.text,name),

                    width: MediaQuery.of(context).size.width,
                  ),

                  SizedBox(height: 20,),

                  Container(
                    child: formField(data.email,'Email','name@example.com',Icon(Icons.email_outlined,color: Colors.indigo,),TextInputType.emailAddress,email),

                    width: MediaQuery.of(context).size.width,
                  ),

                  SizedBox(height: 20,),


                  Container(
                    child: formField(data.phone,'Phone Number','01*********',Icon(Icons.phone,color: Colors.indigo,),TextInputType.number,number),

                    width: MediaQuery.of(context).size.width,
                  ),

                  SizedBox(height: 35,),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  UpdateDone()),
                        );
                      },
                      child:Text('Update')
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget formField(String initial ,String label,String hint,Icon icon,TextInputType textInputType, String valueString ) {
    return Consumer<LoginToHome>(
      builder: (context,value,child){
        return TextFormField(
          initialValue: initial ,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(),
            prefixIcon: icon,
          ),
          keyboardType: textInputType,

          onSaved: (value) {
            valueString = value!;
          },
        );
      },
    );
  }

 /* Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'name@example.com',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email_outlined,color: Colors.indigo,),
      ),
      keyboardType: TextInputType.emailAddress,

      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget phoneField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: '01*********',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.phone,color: Colors.indigo,),
      ),
      keyboardType: TextInputType.number,



      onSaved: (value) {
         number = value!;
      },
    );
  }

*/


}
