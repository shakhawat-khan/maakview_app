import 'package:flutter/material.dart';
import '../view/orders/cart_view.dart';

class CartProvider with ChangeNotifier {



  int _counter = 0;
  int get counter => _counter;
  int check = 0;
  int orderNumber = 0;
  bool isChecked = false;
  int total_price = 0;
  String addCart_check= 'Added to your cart';

  int addCart_check_flag = 0;



  double _totalPrice = 0.0;
  //double get totalPrice => _totalPrice;
  //final List<String> order_view = [];
  final List<OrderView> orderView_list =[];
  int fullPrince = 1;


  void addProductCart(String image,String name,int price,int quantity,int id,int all_price){

    if(orderView_list.isEmpty){
      OrderView orderView = OrderView(card_image: image, card_name: name, card_price: price,quantity: quantity,id: id,all_price: all_price );
      orderView_list.add(orderView);
      total_price = total_price + all_price;
      orderNumber = orderView_list.length;
    } else {
      for(int i=0;i<orderView_list.length;i++){
        if(orderView_list[i].id== id){
          //test[i].quantity++;

        } else{
          check++;
        }

      }

      if(check == orderView_list.length){
        OrderView orderView = OrderView(card_image: image, card_name: name, card_price: price,quantity: quantity,id: id,all_price: all_price);
        orderView_list.add(orderView);
        //print('check from if $check');
        total_price = total_price + all_price;
        orderNumber = orderView_list.length;
        check =0;
      } else {
        check = 0;
        //print(check);
      }

    }


    //increseQuantity(orderView.quantity);

    notifyListeners();
  }


  void checkCart(int id){

    if(orderView_list.length==0){
      addCart_check = 'Added to your cart';
    } else{

      for(int i=0;i<orderView_list.length;i++)
      {
        if(orderView_list[i].id==id)
        {
          addCart_check = 'This product is already in cart in your cart';
          break;
        } else{

          addCart_check = 'Added to your cart';
        }
      }

    }





    notifyListeners();

  }


  void increseQuantity (int index){

    orderView_list[index].quantity++;
    //print(test[index].quantity);
    total_price =  orderView_list[index].card_price + total_price;
    //test[index].all_price = test[index].all_price+test[index].all_price;
    notifyListeners();

  }

  void decreaseQuantity (int index){

    if(orderView_list[index].quantity >0 ){
      orderView_list[index].quantity--;
      total_price = total_price - orderView_list[index].card_price  ;
      notifyListeners();
    }

    //test[index].quantity--;
    //print(test[index].quantity);
    //total_price = total_price - test[index].card_price  ;
    //test[index].all_price = test[index].all_price-test[index].card_price;
    notifyListeners();
  }

  void totalPrice (int index){

    orderView_list[index].all_price = orderView_list[index].quantity*orderView_list[index].card_price;
    //total_price =  test[index].all_price + total_price;
    //print(test[index].quantity);
    notifyListeners();
  }

  void deleteCart (int index){
    total_price = total_price - orderView_list[index].all_price;
    orderView_list.removeAt(index);
    orderNumber = orderView_list.length;
    notifyListeners();
  }


}
