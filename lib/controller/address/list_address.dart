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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
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
                child: Card(
                  elevation: 5,
                  color: Colors.white60,
                  child: Column(
                      children: [

                        SizedBox(height: 10,),
                        Text('Country',style: TextStyle(fontSize: 15,fontWeight:FontWeight.w600,),),
                        Text(data[index].country.toString()),
                        Text('City',style: TextStyle(fontSize: 15,fontWeight:FontWeight.w600,),),
                        Text(data[index].city.toString()),
                        Text('Address',style: TextStyle(fontSize: 15,fontWeight:FontWeight.w600,),),
                        Text(data[index].address.toString()),

                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),
              );

         }
     );
  }
}
