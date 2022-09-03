

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/controller/home/laptop_data.dart';
import 'package:maakview_app/controller/home/mobile_and_gadgets.dart';
import 'package:maakview_app/controller/home/most_popular_data/most_popular_data.dart';
import 'package:maakview_app/view/flash_sale/flash_sale.dart';
import 'package:maakview_app/view/loading_screen/loading_screen.dart';
import 'package:marquee_widget/marquee_widget.dart';
import '../../controller/auth/response_phone_number_data.dart';

import '../../controller/home/flash_sale_banner_data.dart';
import '../../controller/home/flash_sale_data.dart';
import '../../controller/home/home_banner_data.dart';
//import '../../controller/home_slider/home_banner_data.dart';
import '../../controller/home/number_two_slider_data.dart';
import '../../model/home/all_categories_slider_model.dart';
import '../../routes/routes.dart';
import '../bottom_navBar/bottom_nav.dart';

import '../../controller/home/popular_categories_data.dart';

import '../../controller/home/most_popular_banner_data.dart';

import 'package:http/http.dart' as http ;
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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

  Future _refresh()async{

    await Future.delayed(Duration(seconds: 3));


  }


  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    String search_value = '';
    final globalKey = GlobalKey<ScaffoldState>();
    return Builder(
      builder: (context) {
        return Scaffold(
          key: globalKey,

          endDrawer:ResponseNumber(),
          backgroundColor: Colors.white,
          appBar: AppBar(

            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.person_rounded,color: Colors.grey,size: 30,),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
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

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
            child: RefreshIndicator(
              onRefresh: _refresh,

              child: SingleChildScrollView(
                controller: ScrollController(),

                scrollDirection: Axis.vertical,
                //physics: const BouncingScrollPhysics(),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      height: 50,
                      child: CupertinoSearchTextField(
                        //backgroundColor: Colors.grey,

                        borderRadius: BorderRadius.circular(10),

                        /*onChanged: (value){

                          setState(() {
                            search_value = value;
                          });
                        },
*/
                        onSubmitted: (value){
                          Navigator.of(context).pushNamed(RouteManager.search,arguments:
                          {'keyword' : value}
                          );
                        },

                      ),
                    ),

                    SizedBox(height: 20,),


                    SlideShowData(),

                    SizedBox(height: 10,),

                  Row(
                    children: [
                      Text(
                          'Popular Categories',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                      ),

                      Spacer(),

                      RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RouteManager.view_all_categories);

                        },

                        child: Text(
                          'View All >',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ),
                    ],
                  ),

                    PopularCategoriesData(),

                    Row(
                      children: [
                        Text(
                          'Most Popular',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),

                    MostPopularData(),

                    SizedBox(height: 15,),

                    MostPopularBannerData(),

                    SizedBox(height: 18,),

                    Text(
                      'Flash Sale',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
                    ),

                    FlashSaleData(),

                    SizedBox(height: 15,),

                    FlashSaleBannerData(),

                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text(
                          'Laptop',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ],
                    ),

                    SizedBox(height: 15,),

                    LaptopData(),

                    SizedBox(height: 15,),

                    SliderNumberTwo(),

                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text(
                          'Mobile & Gadgets',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          )
                        ),
                      ],
                    ),

                    MobileGadgets(),

                    SizedBox(height: 15,),

                    //LoadingScreen(),

                ]
              ),
            ),
            ),

          /*bottomNavigationBar: BottomNavigationBar(

            backgroundColor: Colors.grey,
            onTap:(index)=> setState(() {
              selectedIndex = index;
              print(index);
            }) ,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category',),
              BottomNavigationBarItem(icon: Icon(Icons.add),label: 'My Shop',),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Orders',),
              BottomNavigationBarItem(icon: Icon(Icons.payment_outlined),label: 'Payments',),

            ],


          ),*/
        )
        );
      }
    );
  }
}
