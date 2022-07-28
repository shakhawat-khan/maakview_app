import 'package:flutter/material.dart';
import 'package:maakview_app/view/bottom_navBar/bottom_nav.dart';
import '../../controller/home/most_popular_data/details_most_popular_data.dart';

class DetailsData extends StatelessWidget {

  final slug;

  DetailsData({required this.slug});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
        actions: [
          InkWell(
            onTap: (){

            },
            child: Icon(Icons.shopping_cart),
          ),

          SizedBox(width: 20,),
        ],

      ),

      body: DetailsMostPopularData(slug: slug,),

      //bottomNavigationBar:BottomNav() ,

    );
  }
}
