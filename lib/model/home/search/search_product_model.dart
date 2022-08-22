// To parse this JSON data, do
//
//     final searchProductList = searchProductListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchProductList searchProductListFromJson(String str) => SearchProductList.fromJson(json.decode(str));

String searchProductListToJson(SearchProductList data) => json.encode(data.toJson());

class SearchProductList {
  SearchProductList({
    required this.success,
    required this.products,
    required this.totalPage,
    required this.currentPage,
    required this.total,
    required this.parentCategory,
    required this.currentCategory,
    required this.childCategories,
    required this.rootCategories,
    required this.allBrands,
    required this.attributes,
  });

  bool success;
  Products products;
  int totalPage;
  int currentPage;
  int total;
  dynamic parentCategory;
  dynamic currentCategory;
  dynamic childCategories;
  RootCategories rootCategories;
  AllBrands allBrands;
  AllBrands attributes;

  factory SearchProductList.fromJson(Map<String, dynamic> json) => SearchProductList(
    success: json["success"],
    products: Products.fromJson(json["products"]),
    totalPage: json["totalPage"],
    currentPage: json["currentPage"],
    total: json["total"],
    parentCategory: json["parentCategory"],
    currentCategory: json["currentCategory"],
    childCategories: json["childCategories"],
    rootCategories: RootCategories.fromJson(json["rootCategories"]),
    allBrands: AllBrands.fromJson(json["allBrands"]),
    attributes: AllBrands.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "products": products.toJson(),
    "totalPage": totalPage,
    "currentPage": currentPage,
    "total": total,
    "parentCategory": parentCategory,
    "currentCategory": currentCategory,
    "childCategories": childCategories,
    "rootCategories": rootCategories.toJson(),
    "allBrands": allBrands.toJson(),
    "attributes": attributes.toJson(),
  };
}

class AllBrands {
  AllBrands({
    required this.data,
  });

  List<AllBrandsDatum> data;

  factory AllBrands.fromJson(Map<String, dynamic> json) => AllBrands(
    data: List<AllBrandsDatum>.from(json["data"].map((x) => AllBrandsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AllBrandsDatum {
  AllBrandsDatum({
    required this.id,
    required this.slug,
    required this.name,
    required this.logo,
  });

  int id;
  String slug;
  String name;
  String logo;

  factory AllBrandsDatum.fromJson(Map<String, dynamic> json) => AllBrandsDatum(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "logo": logo,
  };
}

class Products {
  Products({
    required this.data,
  });

  List<ProductsDatum> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    data: List<ProductsDatum>.from(json["data"].map((x) => ProductsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductsDatum {
  ProductsDatum({
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

  factory ProductsDatum.fromJson(Map<String, dynamic> json) => ProductsDatum(
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

class RootCategories {
  RootCategories({
    required this.data,
  });

  List<RootCategoriesDatum> data;

  factory RootCategories.fromJson(Map<String, dynamic> json) => RootCategories(
    data: List<RootCategoriesDatum>.from(json["data"].map((x) => RootCategoriesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RootCategoriesDatum {
  RootCategoriesDatum({
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

  factory RootCategoriesDatum.fromJson(Map<String, dynamic> json) => RootCategoriesDatum(
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
