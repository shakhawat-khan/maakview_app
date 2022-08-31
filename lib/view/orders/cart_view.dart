import 'package:flutter/material.dart';

class OrderView   {
  String card_image;
  String card_name;
  int card_price;
  int quantity ;
  int id;
  int all_price;




  OrderView({required this.card_image,
    required this.card_name,
    required this.card_price,
    required this.quantity,
    required this.id,
    required this.all_price,

  });

  OrderView.fromJson(Map<String,dynamic> json) :
    card_image=json['card_image'],
    card_name = json['card_name'],
    card_price = json['card_price'],
    quantity = json['quantity'],
    id = json['id'],
    all_price = json['all_price'];

    Map<String,dynamic> toJson()=> {
      'card_image': card_image,
      'card_name' : card_name,
      'card_price' : card_price,
      'quantity' : quantity,
      'id' : id,
      'all_price' : all_price,
    };


}


