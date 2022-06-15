import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import '../../model/home_banner.dart';


class HomeSliderData{

  Future<BannerModel> getBanner() async{
    http.Response response;
    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/banner_section_one'));

    if(response.statusCode == 200){
      return BannerModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load');
    }

  }

}