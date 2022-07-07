import 'package:flutter/material.dart';
import '../view/orders/cart_view.dart';

class CartProvider with ChangeNotifier {



  int _counter = 0;
  int get counter => _counter;
  int check = 0;



  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  //final List<String> order_view = [];
  final List<OrderView> test =[];




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



  void addProductCart(String image,String name,int price,int quantity,int id){

    if(test.isEmpty){
      OrderView orderView = OrderView(card_image: image, card_name: name, card_price: price,quantity: quantity,id: id);
      test.add(orderView);
    } else {
      for(int i=0;i<test.length;i++){
        if(test[i].id== id){
          test[i].quantity++;

        } else{
          check++;
        }

      }

      if(check == test.length){
        OrderView orderView = OrderView(card_image: image, card_name: name, card_price: price,quantity: quantity,id: id);
        test.add(orderView);
        //print('check from if $check');
        check =0;
      } else {
        check = 0;
        //print(check);
      }

    }


    //increseQuantity(orderView.quantity);

    notifyListeners();
  }


  void increseQuantity (int quantity){

    quantity++;
    print(quantity);
  }








}
