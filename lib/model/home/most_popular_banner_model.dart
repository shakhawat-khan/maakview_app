// To parse this JSON data, do
//
//     final mostPopularBannerModel = mostPopularBannerModelFromJson(jsonString);

import 'dart:convert';

MostPopularBannerModel mostPopularBannerModelFromJson(String str) => MostPopularBannerModel.fromJson(json.decode(str));

String mostPopularBannerModelToJson(MostPopularBannerModel data) => json.encode(data.toJson());

class MostPopularBannerModel {
  MostPopularBannerModel({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory MostPopularBannerModel.fromJson(Map<String, dynamic> json) => MostPopularBannerModel(
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
