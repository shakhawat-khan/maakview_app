import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maakview_app/model/home/most_popular_model.dart';
import 'package:http/http.dart' as http ;

class MostPopularData extends StatefulWidget {
  const MostPopularData({Key? key}) : super(key: key);

  @override
  State<MostPopularData> createState() => _MostPopularDataState();
}

class _MostPopularDataState extends State<MostPopularData> {
  @override

  Future<MostPopularModel> getPopularCard() async
  {
    http.Response response;
    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/product_section_one'));

    if(response.statusCode == 200){
      return MostPopularModel.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Failed to load');
    }

  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<MostPopularModel>(
        future: getPopularCard(),
        builder: (context,snapshot){
          final most_popular = snapshot.data;

          if(snapshot.hasData){
            return buildMostPopularItem(most_popular!);
          } else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator());

        } ,
      ),
    );
  }

  Widget buildMostPopularItem(MostPopularModel mostPopularModel){
    return Card(
      child: Text('hello'),
    );
  }

}
