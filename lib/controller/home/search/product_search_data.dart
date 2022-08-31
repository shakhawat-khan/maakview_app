import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';

import '../../../model/home/search/search_product_model.dart';

import '../../../view/details_of_product/details_data.dart';
import '../most_popular_data/details_most_popular_data.dart';

class SearchResult extends StatelessWidget {
  final keyword;

  SearchResult({required this.keyword});

  @override
  Widget build(BuildContext context) {

    Future<SearchProductList>getData() async{
      http.Response response = await http.post(Uri.parse('https://v1.maakview.com/api/v1/auth/search_for_api'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*", // Required for CORS support to work
          "Access-Control-Allow-Methods": "POST, OPTIONS",
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",

        },

        body: jsonEncode(<String, String>{
          "keyword": keyword
        }),
      );

      if(response.statusCode == 200){
        //print(response.body);
        return SearchProductList.fromJson(jsonDecode(response.body));
      } else {
        //print('hoy na');
        //print(response.statusCode);

        throw Exception('Failed  to create album');
      }

    }


    return FutureBuilder<SearchProductList>(
        future: getData(),
        builder: (context,snapshot){

          final data = snapshot.data;

          if(snapshot.hasData){

            if(data?.products.data.length == 0){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/no_product_found/no-product.png',fit: BoxFit.fill,) ,
                    ),



                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('$keyword name of this Product is not found !!!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )
                      ),
                    ),
                  ],
                ),
              );
            } else
              {
                return buildList(data!,context);
              }



            //Text(snapshot.data!.user.email);
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator());

        }

    );

  }

  buildList(SearchProductList searchProductList ,BuildContext context){



    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: searchProductList.products.data.length,
        itemBuilder: (context,index){

          final data = searchProductList.products.data[index];
          final oCcy = new NumberFormat("#,##0.00", "en_US");
          final discount1 = (data.baseDiscountedPrice/data.basePrice)*100 ;
          final discount = (100-discount1).ceil();


          return Container(
              height:MediaQuery.of(context).size.height/8,
            child: data.basePrice==data.baseDiscountedPrice? Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: InkWell(

                    onTap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DetailsData (slug: data.slug,)),
                      );

                    },

                    child: Card(

                      child: ListTile(

                        leading: Image.network(data.thumbnailImage,),
                        title: Text(data.name,overflow:TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                        ),
                        subtitle: Text('৳' + '${oCcy.format(data.baseDiscountedPrice)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 15

                          ) ,
                        ),


                      ),
                    )
                )
            ): Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: InkWell(

                    onTap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DetailsData (slug: data.slug,)),
                      );

                    },

                    child: Card(
                      child: ListTile(
                        leading: Image.network(data.thumbnailImage,),
                        title: Text(data.name,overflow:TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                        ),
                        subtitle: Text('৳' + '${oCcy.format(data.baseDiscountedPrice)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 15

                          ) ,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 40,
                              color: Colors.red,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'OFF ${discount} %',
                                  style: TextStyle(color: Colors.white,fontSize: 9,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),


                      ),
                    )
                )
            )

          );

        }
    );
  }



}
