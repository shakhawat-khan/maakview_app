class ListAddress {
  List<Data>? data;
  bool? success;
  int? status;

  ListAddress({this.data, this.success, this.status});

  ListAddress.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? address;
  String? country;
  String? city;
  String? state;
  String? postalCode;
  String? phone;
  String? defaultShipping;
  String? defaultBilling;

  Data(
      {this.id,
        this.userId,
        this.address,
        this.country,
        this.city,
        this.state,
        this.postalCode,
        this.phone,
        this.defaultShipping,
        this.defaultBilling});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    defaultShipping = json['default_shipping'];
    defaultBilling = json['default_billing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['phone'] = this.phone;
    data['default_shipping'] = this.defaultShipping;
    data['default_billing'] = this.defaultBilling;
    return data;
  }
}