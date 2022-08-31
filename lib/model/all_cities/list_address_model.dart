// To parse this JSON data, do
//
//     final listAddress = listAddressFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListAddress listAddressFromJson(String str) => ListAddress.fromJson(json.decode(str));

String listAddressToJson(ListAddress data) => json.encode(data.toJson());

class ListAddress {
  ListAddress({
    required this.data,
    required this.success,
    required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory ListAddress.fromJson(Map<String, dynamic> json) => ListAddress(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.address,
    required this.country,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.phone,
    required this.defaultShipping,
    required this.defaultBilling,
  });

  int id;
  String userId;
  String address;
  String country;
  String city;
  String state;
  String postalCode;
  String phone;
  String defaultShipping;
  String defaultBilling;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postal_code"],
    phone: json["phone"],
    defaultShipping: json["default_shipping"],
    defaultBilling: json["default_billing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "address": address,
    "country": country,
    "city": city,
    "state": state,
    "postal_code": postalCode,
    "phone": phone,
    "default_shipping": defaultShipping,
    "default_billing": defaultBilling,
  };
}
