
import 'package:flutter/material.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/user_address/delete.dart';
import 'package:maakview_app/view/user_address/update_done_address_update.dart';
import 'package:provider/provider.dart';

class UpdateDataAddress extends StatelessWidget {

   final city;
   final address;
   final address_id;

   UpdateDataAddress({required this.city,required this.address,required this.address_id});


  @override
  Widget build(BuildContext context) {

    TextEditingController textFieldController1 = TextEditingController(text: city);
    TextEditingController textFieldController2 = TextEditingController(text: address);
    TextEditingController textFieldController3 = TextEditingController();


    return Scaffold(
      appBar: AppBar(title: Text('Update Address'),
      ),

      body: Consumer<LoginToHome>(
        builder: (context,value,child){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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

                SizedBox(height: 35,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  UpdateDoneAddressUpdate(
                              id: value.id1 ,
                              address_id:address_id,
                              city: city,
                              address: textFieldController2.text,
                            )),
                          );
                        },
                        child:Text('Update')
                    ),
                  ],
                ),

              ],
            ),
          );
        },

      ) ,

    );
  }
}
