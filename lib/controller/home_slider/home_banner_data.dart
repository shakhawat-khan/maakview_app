import 'dart:convert';
import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import '../../model/home_banner.dart';



class SlideShowData extends StatelessWidget {

  Future<BannerModel> getBanner() async{
    http.Response response;
    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/sliders'));

    if(response.statusCode == 200){
      return BannerModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<BannerModel>(
        future: getBanner() ,
        builder: (context,snapshot){
          final bannerModel = snapshot.data;

          if(snapshot.hasData){
            return buildSlider(bannerModel!);
          } else if (snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  /*Widget buildSlider(BannerModel bannerModel){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
        itemCount: bannerModel.data.one.length,
        itemBuilder:(context,index){
          final data = bannerModel.data.one[index];

          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(data.img,fit: BoxFit.contain,),
              ],
            ),
          );

        }
    );
  }*/

  Widget buildSlider(BannerModel bannerModel){
    return CarouselSlider(
      options:CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        reverse: false,
      ) ,

      items:

      );
  }

}



