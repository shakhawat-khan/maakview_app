import 'package:flutter/material.dart';
import 'package:maakview_app/controller/home/search/product_search_data.dart';

class Result extends StatelessWidget {

  final keyword;

  Result({required this.keyword});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
      ),

      body: SearchResult(keyword: keyword,)

    );
  }
}
