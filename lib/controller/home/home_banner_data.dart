import 'dart:convert';
import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import '../../model/home/home_banner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class SlideShowData extends StatefulWidget {

  @override
  State<SlideShowData> createState() => _SlideShowDataState();
}

class _SlideShowDataState extends State<SlideShowData> {

  int activeIndex = 0;

  Future<BannerModel> getBanner() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://www.maakview.com/api/v1/setting/home/sliders'));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return BannerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<BannerModel>(
        future: getBanner(),
        builder: (context, snapshot) {
          final bannerModel = snapshot.data;

          //print(snapshot.data);



          if (snapshot.hasData ) {
            //print('has data');
            return buildSlider(bannerModel!);

          } else if (snapshot.hasError) {
            //print('has no data');
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  /*Widget buildSlider(BannerModel bannerModel) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: bannerModel.data.one.length,
        itemBuilder: (context, index) {
          final data = bannerModel.data.one[index];

          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(data.img, fit: BoxFit.contain,),
              ],
            ),
          );
        }
    );
  }*/
  Widget buildSlider(BannerModel bannerModel) {

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
            itemCount: bannerModel.data.one.length,
            itemBuilder: (BuildContext context, int itemIndex, int
            pageViewIndex) {
              final data = bannerModel.data.one[itemIndex];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl:data.img ,
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.fill,

                ),
              );
            },


            options: CarouselOptions(

              height: 200.0,
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

            )
        ),
        //SizedBox(height: 10,),
        Positioned(
            bottom: 9,
            child: buildIndicator(bannerModel)
        ),

      ],
    );

  }

  Widget buildIndicator(BannerModel bannerModel) => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: bannerModel.data.one.length,
    effect: WormEffect(
      dotWidth: 5,
      dotHeight: 5,
      spacing: 3,
      dotColor: Colors.grey,
      activeDotColor: Colors.white
    ),

  );



}




