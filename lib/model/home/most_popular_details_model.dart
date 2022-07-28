// To parse this JSON data, do
//
//     final mostPopularDataDetailsModel = mostPopularDataDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MostPopularDataDetailsModel mostPopularDataDetailsModelFromJson(String str) => MostPopularDataDetailsModel.fromJson(json.decode(str));

String mostPopularDataDetailsModelToJson(MostPopularDataDetailsModel data) => json.encode(data.toJson());

class MostPopularDataDetailsModel {
  MostPopularDataDetailsModel({
    required this.data,
    required this.success,
    required this.status,
  });

  Data data;
  bool success;
  int status;

  factory MostPopularDataDetailsModel.fromJson(Map<String, dynamic> json) => MostPopularDataDetailsModel(
    data: Data.fromJson(json["data"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
    "status": status,
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.brand,
    required this.photos,
    required this.thumbnailImage,
    required this.tags,
    required this.featured,
    required this.stock,
    required this.minQty,
    required this.maxQty,
    required this.unit,
    required this.discount,
    required this.discountType,
    required this.basePrice,
    required this.highestPrice,
    required this.baseDiscountedPrice,
    required this.highestDiscountedPrice,
    required this.standardDeliveryTime,
    required this.expressDeliveryTime,
    required this.isVariant,
    required this.hasWarranty,
    required this.reviewSummary,
    required this.description,
    required this.variations,
    required this.variationOptions,
    required this.shop,
  });

  int id;
  String name;
  Brand brand;
  List<String> photos;
  String thumbnailImage;
  List<String> tags;
  int featured;
  int stock;
  int minQty;
  int maxQty;
  dynamic unit;
  String discount;
  String discountType;
  int basePrice;
  int highestPrice;
  int baseDiscountedPrice;
  int highestDiscountedPrice;
  int standardDeliveryTime;
  int expressDeliveryTime;
  String isVariant;
  String hasWarranty;
  ReviewSummary reviewSummary;
  String description;
  List<Variation> variations;
  List<dynamic> variationOptions;
  Shop shop;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    brand: Brand.fromJson(json["brand"]),
    photos: List<String>.from(json["photos"].map((x) => x)),
    thumbnailImage: json["thumbnail_image"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    featured: json["featured"],
    stock: json["stock"],
    minQty: json["min_qty"],
    maxQty: json["max_qty"],
    unit: json["unit"],
    discount: json["discount"],
    discountType: json["discount_type"],
    basePrice: json["base_price"],
    highestPrice: json["highest_price"],
    baseDiscountedPrice: json["base_discounted_price"],
    highestDiscountedPrice: json["highest_discounted_price"],
    standardDeliveryTime: json["standard_delivery_time"],
    expressDeliveryTime: json["express_delivery_time"],
    isVariant: json["is_variant"],
    hasWarranty: json["has_warranty"],
    reviewSummary: ReviewSummary.fromJson(json["review_summary"]),
    description: json["description"],
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    variationOptions: List<dynamic>.from(json["variation_options"].map((x) => x)),
    shop: Shop.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand.toJson(),
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "thumbnail_image": thumbnailImage,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "featured": featured,
    "stock": stock,
    "min_qty": minQty,
    "max_qty": maxQty,
    "unit": unit,
    "discount": discount,
    "discount_type": discountType,
    "base_price": basePrice,
    "highest_price": highestPrice,
    "base_discounted_price": baseDiscountedPrice,
    "highest_discounted_price": highestDiscountedPrice,
    "standard_delivery_time": standardDeliveryTime,
    "express_delivery_time": expressDeliveryTime,
    "is_variant": isVariant,
    "has_warranty": hasWarranty,
    "review_summary": reviewSummary.toJson(),
    "description": description,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    "variation_options": List<dynamic>.from(variationOptions.map((x) => x)),
    "shop": shop.toJson(),
  };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.logo,
  });

  int id;
  String name;
  String slug;
  String logo;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "logo": logo,
  };
}

class ReviewSummary {
  ReviewSummary({
    required this.average,
    required this.totalCount,
    required this.count5,
    required this.count4,
    required this.count3,
    required this.count2,
    required this.count1,
  });

  int average;
  int totalCount;
  int count5;
  int count4;
  int count3;
  int count2;
  int count1;

  factory ReviewSummary.fromJson(Map<String, dynamic> json) => ReviewSummary(
    average: json["average"],
    totalCount: json["total_count"],
    count5: json["count_5"],
    count4: json["count_4"],
    count3: json["count_3"],
    count2: json["count_2"],
    count1: json["count_1"],
  );

  Map<String, dynamic> toJson() => {
    "average": average,
    "total_count": totalCount,
    "count_5": count5,
    "count_4": count4,
    "count_3": count3,
    "count_2": count2,
    "count_1": count1,
  };
}

class Shop {
  Shop({
    required this.name,
    required this.logo,
    required this.rating,
    required this.reviewCount,
    required this.slug,
  });

  String name;
  String logo;
  int rating;
  String reviewCount;
  String slug;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    name: json["name"],
    logo: json["logo"],
    rating: json["rating"],
    reviewCount: json["review_count"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
    "rating": rating,
    "review_count": reviewCount,
    "slug": slug,
  };
}

class Variation {
  Variation({
    required this.id,
    required this.code,
    required this.img,
    required this.price,
    required this.stock,
  });

  int id;
  dynamic code;
  dynamic img;
  int price;
  String stock;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    code: json["code"],
    img: json["img"],
    price: json["price"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "img": img,
    "price": price,
    "stock": stock,
  };
}
