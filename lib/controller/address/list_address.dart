import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/all_cities/list_address_model.dart';
import 'package:http/http.dart' as http ;

class ListAddressData extends StatelessWidget {


   String id;

   ListAddressData({required this.id});

   Future<ListAddress> getListAddressData()async{
     http.Response response;

     response = await http.get(Uri.parse('http://v1.maakview.com/api/v1/auth/addresses_for_apps/93'));

     
     if(response.statusCode ==200){
       print(response.body);
       print(id.toString());
       return ListAddress.fromJson(jsonDecode(response.body));
     } else {
       throw Exception('Failed to load');
     }
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height/2,
      child: FutureBuilder<ListAddress>(
        future:getListAddressData() ,
        builder: (context,snapshot){
          final data  = snapshot.data;

          if(snapshot.hasData){
            print(data);
            return listCities(data!);
          } else if (snapshot.hasError){
            print('kaj hoy na');
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
          itemCount: data.length,
         itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(

                  title: Column(
                    children: [

                      Text(data[index].country),
                      Text(data[index].address),
                      Text(data[index].city)

                    ],
                  ),
                ),
              ),
            );
         }
     );
  }



}
