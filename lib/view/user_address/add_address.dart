import 'package:flutter/material.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/bottom_navBar/bottom_nav.dart';
import 'package:maakview_app/view/user_address/update_done_address.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController textFieldController1 = TextEditingController();
    TextEditingController textFieldController2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),

      body: Consumer<LoginToHome>(

        builder: (context,value,child){

          return Column(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: textFieldController1,
                  decoration: InputDecoration(
                    labelText: 'City',
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

              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: textFieldController2,
                  decoration: InputDecoration(
                    labelText: 'Address',
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

              ElevatedButton(onPressed: (){

                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context, )=> UpdateDoneAddress(id: value.id1 ,address:textFieldController2.text ,city:textFieldController1.text ,phone:value.number ,) )
                );

              }, child: Text('submit'))

            ],

          );
        },

      ),

    );
  }
}
