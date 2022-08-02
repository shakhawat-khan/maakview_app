

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maakview_app/controller/home/most_popular_data/most_popular_data.dart';
import 'package:maakview_app/view/flash_sale/flash_sale.dart';
import 'package:maakview_app/view/loading_screen/loading_screen.dart';
import 'package:marquee_widget/marquee_widget.dart';
import '../../controller/home/flash_sale_data.dart';
import '../../controller/home/home_banner_data.dart';
//import '../../controller/home_slider/home_banner_data.dart';
import '../../routes/routes.dart';
import '../bottom_navBar/bottom_nav.dart';

import '../../controller/home/all_categories_slider_data.dart';

import '../../controller/home/most_popular_banner_data.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      endDrawer: Drawer(
        //backgroundColor: Colors.black,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                Container(
                  height: 50,
                  child: CupertinoSearchTextField(
                    //backgroundColor: Colors.grey,

                    borderRadius: BorderRadius.circular(10),

                  ),
                ),

                SizedBox(height: 20,),


                SlideShowData(),


                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Categories',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 16),
                          fontWeight: FontWeight.w500),
                ),

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
                //MostPopularData(),

               /* SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/commons/b/b4/Chess_ndd45.svg',
                  placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()),
                ),*/

                Row(
                  children: [
                    Text(
                      'Most Popular',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 16),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                MostPopularData(),

                SizedBox(height: 15,),

                MostPopularBannerData(),

                SizedBox(height: 18,),

                Row(
                  children: [
                    Text(
                      'Flash Sale',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 16),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                FlashSaleData(),



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
}
