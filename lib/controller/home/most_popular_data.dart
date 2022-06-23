import 'dart:convert';
import 'dart:js';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

import '../../model/home/most_popular_model.dart';
import 'package:like_button/like_button.dart';

class MostPopularData extends StatelessWidget {

  final ScrollController _controller = ScrollController();

  Future<MostPopularModel> getPopularData() async{
    http.Response response;
    
    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/product_section_one'));

    if(response.statusCode == 200){
      return MostPopularModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load');
    }
    
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      child: FutureBuilder<MostPopularModel> (
        future: getPopularData(),
        builder: (context,snapshot){
          final data  = snapshot.data;

          if(snapshot.hasData){
            return buildMostPopular(data!);
          } else if (snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator());

        },
      ),
    );
  }

  Widget buildMostPopular(MostPopularModel mostPopularModel){
    final oCcy = new NumberFormat("#,##0.00", "en_US");

    return Container(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        controller:  _controller,
        scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: mostPopularModel.data.products.data.length,
          itemBuilder: (context,index){
          final data = mostPopularModel.data.products.data[index];

          return InkWell(
            onTap: (){

            },
            child: Container(

              width: 150,

              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  child: Column(
                    children: [
                      Image.network(data.thumbnailImage,fit: BoxFit.fitWidth,),
                      Row(
                        children: [

                          Text('৳',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          Text('${oCcy.format(data.basePrice)}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          //Text(data.basePrice.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          Spacer(),
                          LikeButton(size: 18,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                          height: 30,
                          child: Text(data.name,style: TextStyle(fontSize: 10,color: Colors.grey),overflow:TextOverflow.ellipsis,maxLines: 2,)
                      ),
                      //SizedBox(height: 10,),
                      Spacer(),
                      Container(height: 20,width: 102,
                        child: ElevatedButton(onPressed: (){},
                          child: Row(
                          children: [
                            Icon(Icons.shopping_cart,size: 18,),
                            Text('Add to cart',style: TextStyle(fontSize: 10),),
                          ],
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

          }
      ),
    );
  }

}
