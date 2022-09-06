import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/all_cities/list_address_model.dart';
import 'package:http/http.dart' as http ;

import '../../view/user_address/update_data.dart';

class ListAddressData extends StatefulWidget {


   final id;

   ListAddressData({required this.id});

  @override
  State<ListAddressData> createState() => _ListAddressDataState();
}

class _ListAddressDataState extends State<ListAddressData> {


   Future<ListAddress> getListAddressData()async{
     http.Response response;

     response = await http.get(Uri.parse('http://v1.maakview.com/api/v1/auth/addresses_for_apps/${widget.id}'));


     if(response.statusCode ==200){
       print(response.body);
       print(widget.id.toString());
       return ListAddress.fromJson(jsonDecode(response.body));
     } else {
       throw Exception('Failed to load');
     }
   }

   var _value  ;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: FutureBuilder<ListAddress>(
        future:getListAddressData() ,
        builder: (context,snapshot){
          final data  = snapshot.data;

          if(snapshot.hasData){
            print(data);
            return listCities(data!);
          } else if (snapshot.hasError){
            //print('kaj hoy na');
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator(color: Colors.white,));
        },
      ),
    );
  }

  Widget listCities(ListAddress listAddress) {
    final data = listAddress.data;

     return ListView.builder(
       scrollDirection:Axis.vertical ,
       shrinkWrap: true,
          itemCount: data!.length,
         itemBuilder: (context,index){
            return Container(

             child: data[index].defaultShipping == "1" ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.green[200],
                  elevation: 2,
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16,),
                      ],
                    ),
                    title: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdateDataAddress(
                            city: data[index].city.toString(),
                            address: data[index].address.toString(),
                            address_id: data[index].id.toString(),
                          )),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index].city.toString()),

                          Text(data[index].address.toString()),

                          //Text('Address',style: TextStyle(fontSize: 15,fontWeight:FontWeight.w600,),),
                        ],

                      ),
                    ),

                    trailing: Text('default'),


                  )
              ),
            ): Card(
               elevation: 5,
              child: RadioListTile(

                   value: index,
                   groupValue: _value,
                   onChanged: (value) async{

                     setState(() {
                       _value = value;
                       getListAddressData();
                     });

                     await http.get(Uri.parse('http://v1.maakview.com/api/v1/auth/defaultShippingAddress_for_apps/${widget.id}/${data[index].id}'));

                   },

                 title: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].city.toString()),
                              Text(data[index].address.toString()),

                            ],
                          ) ),

                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UpdateDataAddress(
                                          city: data[index].city.toString(),
                                          address: data[index].address.toString(),
                                          address_id: data[index].id.toString(),
                                        )),
                                      );
                                    },
                                    child: Text(
                                    'Update',
                                    style: TextStyle(color: Colors.indigo)),
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.indigo[100]),

                                    ),

                                ),

                                SizedBox(height: 5,),

                                TextButton(onPressed: ()async{

                                  setState(() {
                                    http.get(Uri.parse('http://v1.maakview.com/api/v1/auth/deleteShippingAddress_for_apps/${widget.id}/${data[index].id}'));
                                  });

                                }, child:Text('Delete',style: TextStyle(color: Colors.red),),

                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(Colors.red[100]),

                                ),

                                )
                              ],
                            )
                        )
                      ],
                    )

                   ],
                 ) ,

                 //subtitle: Text(data[index].address.toString()),


               ),
            )
            );
         }
     );
  }
}
