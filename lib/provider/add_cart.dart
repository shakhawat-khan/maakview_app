import 'package:flutter/material.dart';
import '../view/orders/cart_view.dart';

class CartProvider with ChangeNotifier {



  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  final List<String> order_view = [];


  void addCounter(){
    _counter++;
    //print('hello provider');
    notifyListeners();

  }

  void removeCounter(){
    _counter--;
    notifyListeners();
  }

  //final name = List<String>;


  void addName(String data,){

    order_view.add(data);
    notifyListeners();
  }







}
