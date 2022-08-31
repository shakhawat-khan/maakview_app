import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/all_cities/cities.dart';

import 'package:http/http.dart' as http ;


class CitiesAddressData extends StatefulWidget {
   CitiesAddressData({Key? key}) : super(key: key);



  @override
  State<CitiesAddressData> createState() => _CitiesAddressDataState();
}

class _CitiesAddressDataState extends State<CitiesAddressData> {
  //List<AllCities> _categoryList = <AllCities>[];
  var _list;


  var countryid; //default id for the dropdown
  //its null for me you can copy an id from api and place here it will be seen....

  dynamic decodeData;

  Future<Allcities> getCitiesData()async{
    http.Response response;


    response = await http.get(Uri.parse('http://v1.maakview.com/api/v1/auth/get_all_cities'));


    if(response.statusCode ==200){
      return Allcities.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception('Failed to load');
    }


  }



  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Allcities>(
        future: getCitiesData(),
        builder: (context,snapshot){
          final data  = snapshot.data;

          if(snapshot.hasData){
            print(data);
            return buildFlashSale(data!);
          } else if (snapshot.hasError){
            print(snapshot.error);
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator(color: Colors.white,));

        },
    );
  }

  Widget buildFlashSale(Allcities allCities)  {

    return ListView.builder(
        shrinkWrap: true,
        itemCount: allCities.data!.length,
        itemBuilder: (context, index) {

          List<String> items = [];


          items.add(allCities.data![index].name.toString());

          //print(items);

          return Column(
            children: [
              Text('hello'),
            ],
          );

        }
      ,


    );

  }



}
