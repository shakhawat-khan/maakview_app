import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [

            Container(
              height: 50,
              child: CupertinoSearchTextField(
                //backgroundColor: Colors.grey,

                borderRadius: BorderRadius.circular(10),


              ),
            ),




          ],
        ),
      ),

    );
  }
}
