import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:maakview_app/view/bottom_navBar/bottom_nav.dart';
import 'package:provider/provider.dart';
import '../../controller/home/most_popular_data/details_most_popular_data.dart';
import '../../provider/add_cart.dart';
import '../../routes/routes.dart';

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

              Navigator.of(context).pushNamed(RouteManager.order_two);

            },
            child: Consumer<CartProvider>(

              builder: (context,value,child){

                return Badge(
                  badgeContent: Text(value.orderNumber.toString(),style: TextStyle(color: Colors.white),),
                  position: BadgePosition.topEnd(end: -10,top: -4),
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_cart),
                  borderRadius: BorderRadius.circular(4),

                );
              }


            ),
          ),

          SizedBox(width: 20,),
        ],

      ),

      body: DetailsMostPopularData(slug: slug,),

      floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: LikeButton(),
          backgroundColor: Colors.white) ,

      //bottomNavigationBar:BottomNav() ,

    );
  }
}
