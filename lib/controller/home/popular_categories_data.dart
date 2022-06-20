import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/home/all_categories_slider_model.dart';

import 'package:http/http.dart' as http ;

import 'package:carousel_slider/carousel_slider.dart';

class PopularCategoriesData extends StatefulWidget {
  const PopularCategoriesData({Key? key}) : super(key: key);

  @override
  State<PopularCategoriesData> createState() => _PopularCategoriesDataState();
}

class _PopularCategoriesDataState extends State<PopularCategoriesData> {

  Future<AllCategorieSlideModel> getCategorie () async {
    http.Response response;

    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/popular_categories'));

    if(response.statusCode==200){
      print('okay');
      return AllCategorieSlideModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(('Failed to load'));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<AllCategorieSlideModel>(
        future: getCategorie(),
        builder: (context,snapshot){
          final all_categories_slide_model = snapshot.data;

          //print(snapshot.data);

          if(snapshot.hasError){
            print('i am here');
            return buildCategorieSlide(all_categories_slide_model!);

          } else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildCategorieSlide(AllCategorieSlideModel allCategorieSlideModel){
    return CarouselSlider.builder(
        itemCount: allCategorieSlideModel.data.data.length,
        itemBuilder:(BuildContext context, int itemIndex , int pageViewIndex){
          final data = allCategorieSlideModel.data.data[itemIndex];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SvgPicture.network(
              data.banner
            ),
          );
        } ,
        options: CarouselOptions(
          height:50,
          enlargeCenterPage: true,
          autoPlay:  true,
          autoPlayAnimationDuration: Duration(microseconds: 800),
          viewportFraction: 1,


        )

    );
  }


}
