import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/home/all_categories_slider_model.dart';

import 'package:http/http.dart' as http ;

import 'package:marquee_widget/marquee_widget.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ViewAllCategories extends StatefulWidget {
  const ViewAllCategories({Key? key}) : super(key: key);

  @override
  State<ViewAllCategories> createState() => _ViewAllCategoriesState();
}



class _ViewAllCategoriesState extends State<ViewAllCategories> {

  final ScrollController _controller = ScrollController();


  Future<AllCategorieSlideModel> getCategorie () async {
    http.Response response;

    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/popular_categories'));

    if(response.statusCode==200){
      //print('okay');
      return AllCategorieSlideModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(('Failed to load'));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,

        elevation: 0,
        title: Row(
          children: [
            Container(
                height:25 ,
                width: 154,
                child: Image.asset('assets/onBoarding_screen/maakview_logo.png')
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Categories',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 16),
                    fontWeight: FontWeight.w500),
              ),

              Container(
                child: FutureBuilder<AllCategorieSlideModel>(
                  future: getCategorie(),
                  builder: (context,snapshot){
                    final all_categories_slide_model = snapshot.data;

                    //print(snapshot.data);

                    if(snapshot.hasData){
                      //print('i am here');
                      return buildCategorieSlide(all_categories_slide_model!);

                    } else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return Center(child: const CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildCategorieSlide(AllCategorieSlideModel allCategorieSlideModel) {
    return Container(
      height: 550,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //mainAxisExtent: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
          ),
          controller: _controller,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: allCategorieSlideModel.data.data.length,
          itemBuilder: (context,index){
            final data = allCategorieSlideModel.data.data[index];
            return Container(
              height: 200,
              width: 100,
              child: InkWell(
                onTap: (){

                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          data.banner,height: 80,width: 70,
                        ),
                      ),

                      Flexible(child: Text(data.name,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),))
                      //Text(data.name)
                    ],
                  ),
                ),
              ),
            );
          }
      ) ,
    );

  }

}




