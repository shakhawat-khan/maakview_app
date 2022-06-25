import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:maakview_app/view/category/categories.dart';
import 'package:maakview_app/view/my_shop/my_shop.dart';
import 'package:maakview_app/view/orders/orders.dart';
import '../home/home_screen.dart';
import '../payment/payment.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   List<Widget> _widgetOptions = <Widget>[
    Home(),
     Categories(),
     MyShop(),
    Orders(),
     Payment(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:_widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'My Shop',
          ),
          BottomNavigationBarItem(
            icon: Badge(
                badgeContent: Text('0',style: TextStyle(color: Colors.white),),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_cart),
              borderRadius: BorderRadius.circular(4),

            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: 'Payments',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
