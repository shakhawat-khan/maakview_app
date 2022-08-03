import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';

import '../../../model/home/most_popular_banner_model.dart';

import 'package:http/http.dart' as http ;

class FlashSaleBannerData extends StatelessWidget {


  Future<MostPopularBannerModel> getBanner() async{
    http.Response response;
    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/banner_section_two'));

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
            return buildSlider(bannerModel!,context);
          } else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return Center(child:CircularProgressIndicator());
        },
      ),
    );

  }

  buildSlider(MostPopularBannerModel mostPopularBannerModel,BuildContext context){
    final data = mostPopularBannerModel.data[0].img;
    return InkWell(
      onTap: (){},
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Image.network(data,fit: BoxFit.fill,),
      ),
    );
  }


}
