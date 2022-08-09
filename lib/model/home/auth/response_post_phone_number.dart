// To parse this JSON data, do
//
//     final responsePostNumber = responsePostNumberFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponsePostNumber responsePostNumberFromJson(String str) => ResponsePostNumber.fromJson(json.decode(str));

String responsePostNumberToJson(ResponsePostNumber data) => json.encode(data.toJson());

class ResponsePostNumber {
  ResponsePostNumber({
    required this.user,
    required this.followedShops,
  });

  User user;
  List<dynamic> followedShops;

  factory ResponsePostNumber.fromJson(Map<String, dynamic> json) => ResponsePostNumber(
    user: User.fromJson(json["user"]),
    followedShops: List<dynamic>.from(json["followed_shops"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "followed_shops": List<dynamic>.from(followedShops.map((x) => x)),
  };
}

class User {
  User({
    required this.id,
    required this.balance,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  int id;
  String balance;
  String name;
  String email;
  String phone;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    balance: json["balance"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "balance": balance,
    "name": name,
    "email": email,
    "phone": phone,
    "avatar": avatar,
  };
}
