// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.one,
    required this.two,
    required this.three,
    required this.four,
  });

  List<Four> one;
  List<Four> two;
  List<Four> three;
  List<Four> four;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    one: List<Four>.from(json["one"].map((x) => Four.fromJson(x))),
    two: List<Four>.from(json["two"].map((x) => Four.fromJson(x))),
    three: List<Four>.from(json["three"].map((x) => Four.fromJson(x))),
    four: List<Four>.from(json["four"].map((x) => Four.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "one": List<dynamic>.from(one.map((x) => x.toJson())),
    "two": List<dynamic>.from(two.map((x) => x.toJson())),
    "three": List<dynamic>.from(three.map((x) => x.toJson())),
    "four": List<dynamic>.from(four.map((x) => x.toJson())),
  };
}

class Four {
  Four({
    required this.img,
    required this.link,
  });

  String img;
  String link;

  factory Four.fromJson(Map<String, dynamic> json) => Four(
    img: json["img"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "link": link,
  };
}
