import 'dart:convert';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import '../../model/home/home_banner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/home/number_two_slider_model.dart';

class SliderNumberTwo extends StatefulWidget {

  @override
  State<SliderNumberTwo> createState() => _SliderNumberTwoState();
}

class _SliderNumberTwoState extends State<SliderNumberTwo> {

  int activeIndex = 0;

  Future<NumberTwoSlider> getBanner() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://www.maakview.com/api/v1/setting/home/banner_section_four'));

    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));
      return NumberTwoSlider.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NumberTwoSlider>(
        future: getBanner(),
        builder: (context,snapshot){
          final bannerModel = snapshot.data;

          if(snapshot.hasData){
            return buildSlider(bannerModel!);
          }

          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator(color: Colors.white,));
        },
      ),
    );
  }

  Widget buildSlider(NumberTwoSlider numberTwoSlider,){
    return CarouselSlider.builder(
        itemCount: numberTwoSlider.data.length,
        itemBuilder: (BuildContext context,int itemIndex,int
            pageViewIndex){
          final data = numberTwoSlider.data[itemIndex];

          return CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            imageUrl:data.img ,
            filterQuality: FilterQuality.low,
            fit: BoxFit.fill,

          );
        },
        options: CarouselOptions(

        //height: 150.0,
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(microseconds: 800),
        viewportFraction: 1,
        onPageChanged: (index,reason)=>
            setState(() {
              activeIndex = index;
              //print(activeIndex);
            })

    ));
  }
}
