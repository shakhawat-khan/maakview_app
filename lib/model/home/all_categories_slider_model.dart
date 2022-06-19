// To parse this JSON data, do
//
//     final allCategorieSlideModel = allCategorieSlideModelFromJson(jsonString);

import 'dart:convert';

AllCategorieSlideModel allCategorieSlideModelFromJson(String str) => AllCategorieSlideModel.fromJson(json.decode(str));

String allCategorieSlideModelToJson(AllCategorieSlideModel data) => json.encode(data.toJson());

class AllCategorieSlideModel {
  AllCategorieSlideModel({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory AllCategorieSlideModel.fromJson(Map<String, dynamic> json) => AllCategorieSlideModel(
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
    required this.data,
  });

  List<Datum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.banner,
    required this.icon,
    required this.slug,
  });

  int id;
  String name;
  String banner;
  String icon;
  String slug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    banner: json["banner"],
    icon: json["icon"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "banner": banner,
    "icon": icon,
    "slug": slug,
  };
}
