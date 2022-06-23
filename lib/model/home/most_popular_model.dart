// To parse this JSON data, do
//
//     final mostPopularModel = mostPopularModelFromJson(jsonString);

import 'dart:convert';

MostPopularModel mostPopularModelFromJson(String str) => MostPopularModel.fromJson(json.decode(str));

String mostPopularModelToJson(MostPopularModel data) => json.encode(data.toJson());

class MostPopularModel {
  MostPopularModel({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory MostPopularModel.fromJson(Map<String, dynamic> json) => MostPopularModel(
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
    required this.title,
    required this.products,
  });

  String title;
  Products products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "products": products.toJson(),
  };
}

class Products {
  Products({
    required this.data,
  });

  List<Datum> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
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
    required this.slug,
    required this.thumbnailImage,
    required this.basePrice,
    required this.baseDiscountedPrice,
    required this.stock,
    required this.unit,
    required this.minQty,
    required this.maxQty,
    required this.rating,
    required this.isVariant,
    required this.variations,
  });

  int id;
  String name;
  String slug;
  String thumbnailImage;
  int basePrice;
  int baseDiscountedPrice;
  String stock;
  dynamic unit;
  String minQty;
  String maxQty;
  int rating;
  int isVariant;
  List<Variation> variations;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    thumbnailImage: json["thumbnail_image"],
    basePrice: json["base_price"],
    baseDiscountedPrice: json["base_discounted_price"],
    stock: json["stock"],
    unit: json["unit"],
    minQty: json["min_qty"],
    maxQty: json["max_qty"],
    rating: json["rating"],
    isVariant: json["is_variant"],
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "thumbnail_image": thumbnailImage,
    "base_price": basePrice,
    "base_discounted_price": baseDiscountedPrice,
    "stock": stock,
    "unit": unit,
    "min_qty": minQty,
    "max_qty": maxQty,
    "rating": rating,
    "is_variant": isVariant,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

class Variation {
  Variation({
    required this.id,
    required this.productId,
    required this.code,
    required this.sku,
    required this.price,
    required this.stock,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String productId;
  dynamic code;
  dynamic sku;
  String price;
  String stock;
  dynamic img;
  DateTime createdAt;
  DateTime updatedAt;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    productId: json["product_id"],
    code: json["code"],
    sku: json["sku"],
    price: json["price"],
    stock: json["stock"],
    img: json["img"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "code": code,
    "sku": sku,
    "price": price,
    "stock": stock,
    "img": img,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
