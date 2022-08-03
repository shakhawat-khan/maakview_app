// To parse this JSON data, do
//
//     final numberTwoSlider = numberTwoSliderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NumberTwoSlider numberTwoSliderFromJson(String str) => NumberTwoSlider.fromJson(json.decode(str));

String numberTwoSliderToJson(NumberTwoSlider data) => json.encode(data.toJson());

class NumberTwoSlider {
  NumberTwoSlider({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory NumberTwoSlider.fromJson(Map<String, dynamic> json) => NumberTwoSlider(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.img,
    required this.link,
  });

  String img;
  String link;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    img: json["img"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "link": link,
  };
}
