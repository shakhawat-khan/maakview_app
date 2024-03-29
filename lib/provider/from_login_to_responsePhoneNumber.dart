import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/home/auth/response_post_phone_number.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginToHome with ChangeNotifier{

  String number='';
  String id1 = '';

  addStringToSF(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', number);
  }


  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('stringValue');
    return stringValue;
  }



  Future<ResponsePostNumber>getData() async{
    http.Response response = await http.post(Uri.parse('https://v1.maakview.com/api/v1/auth/apps_login'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Methods": "POST, OPTIONS",
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",

      },

      body: jsonEncode(<String, String>{
        "phone": '0'+await getStringValuesSF(),
      }),
    );

    if(response.statusCode == 200){
      //print(response.body);
      return ResponsePostNumber.fromJson(jsonDecode(response.body));
    } else {
      //print('hoy na');
      //print(response.statusCode);

      throw Exception('Failed to create album');
    }

  }

  void catchNumber(String num){


  addStringToSF(num);

    notifyListeners();

  }

  void catchId(String id){

    id1 = id;

    notifyListeners();

  }


}