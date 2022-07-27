import 'package:flutter/material.dart';
import '../view/orders/cart_view.dart';

class CartProvider with ChangeNotifier {



  int _counter = 0;
  int get counter => _counter;
  int check = 0;
  int orderNumber = 0;
  bool isChecked = false;
  int total_price = 0;



  double _totalPrice = 0.0;
  //double get totalPrice => _totalPrice;
  //final List<String> order_view = [];
  final List<OrderView> test =[];
  int fullPrince = 1;




/*  void addCounter(){
    _counter++;
    //print('hello provider');
    notifyListeners();

  }

  void removeCounter(){
    _counter--;
    notifyListeners();
  }*/

  //final name = List<String>;



/*  void total (){

    for(int i=0;i<test.length;i++)
    {
        total_price =  test[i].all_price + total_price;
    }

    notifyListeners();

  }*/



  void addProductCart(String image,String name,int price,int quantity,int id,int all_price){

    if(test.isEmpty){
      OrderView orderView = OrderView(card_image: image, card_name: name, card_price: price,quantity: quantity,id: id,all_price: all_price );
      test.add(orderView);
      total_price = total_price + all_price;
      orderNumber = test.length;
    } else {
      for(int i=0;i<test.length;i++){
        if(test[i].id== id){
          //test[i].quantity++;

        } else{
          check++;
        }

      }

      if(check == test.length){
        OrderView orderView = OrderView(card_image: image, card_name: name, card_price: price,quantity: quantity,id: id,all_price: all_price);
        test.add(orderView);
        //print('check from if $check');
        total_price = total_price + all_price;
        orderNumber = test.length;
        check =0;
      } else {
        check = 0;
        //print(check);
      }

    }


    //increseQuantity(orderView.quantity);

    notifyListeners();
  }


  void increseQuantity (int index){

    test[index].quantity++;
    //print(test[index].quantity);
    total_price =  test[index].card_price + total_price;
    //test[index].all_price = test[index].all_price+test[index].all_price;
    notifyListeners();

  }

  void decreaseQuantity (int index){

    if(test[index].quantity >0 ){
      test[index].quantity--;
      total_price = total_price - test[index].card_price  ;
      notifyListeners();
    }

    //test[index].quantity--;
    //print(test[index].quantity);
    //total_price = total_price - test[index].card_price  ;
    //test[index].all_price = test[index].all_price-test[index].card_price;
    notifyListeners();
  }

  void totalPrice (int index){

    test[index].all_price = test[index].quantity*test[index].card_price;
    //total_price =  test[index].all_price + total_price;
    //print(test[index].quantity);
    notifyListeners();
  }

  void deleteCart (int index){
    total_price = total_price - test[index].all_price;
    test.removeAt(index);
    orderNumber = test.length;

    notifyListeners();
  }


}
