import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/home/most_popular_banner_model.dart';

import 'package:http/http.dart' as http ;

class MostPopularBannerData extends StatelessWidget {


  Future<MostPopularBannerModel> getBanner() async{
    http.Response response;
    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/banner_section_one'));

    if(response.statusCode == 200){
      return MostPopularBannerModel.fromJson(jsonDecode(response.body));
    } else{

      throw Exception('Failed to load');
    }


  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<MostPopularBannerModel>(
        future: getBanner() ,
        builder: (context,snapshot){
          final bannerModel = snapshot.data;

          if(snapshot.hasData){
            return buildSlider(bannerModel!);
          } else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return Center(child:CircularProgressIndicator(color: Colors.white,));
        },
      ),
    );

  }

  buildSlider(MostPopularBannerModel mostPopularBannerModel){
    final data = mostPopularBannerModel.data[0].img;
    return InkWell(
      onTap: (){},
      child: Container(
        //height: 100,
        width: double.infinity,
        child: Image.network(data,fit: BoxFit.fill,),
      ),
    );
  }


}
