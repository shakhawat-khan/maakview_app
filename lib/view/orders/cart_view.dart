import 'package:flutter/material.dart';

class OrderView {
  String card_image;
  String card_name;
  int card_price;
  int quantity ;
  int id;
  int all_price;

  OrderView({required this.card_image,required this.card_name,required this.card_price,required this.quantity,required this.id,required this.all_price});

}