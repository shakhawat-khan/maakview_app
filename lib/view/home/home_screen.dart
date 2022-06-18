import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controller/home_slider/home_banner_data.dart';
import '../bottom_navBar/bottom_nav.dart';


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

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNav()


      /*BottomNavigationBar(
        backgroundColor: Colors.grey,
        onTap:(index)=> setState(() {
          selectedIndex = index;
        }) ,
        selectedItemColor: Colors.amber[800],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category',),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'My Shop',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Orders',),
          BottomNavigationBarItem(icon: Icon(Icons.payment_outlined),label: 'Payments',),

        ],
        currentIndex: selectedIndex,

      ),*/

    );
  }
}
