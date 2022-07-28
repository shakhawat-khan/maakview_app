import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';

import '../../../model/home/most_popular_details_model.dart';
import 'package:http/http.dart' as http ;

import 'package:flutter_html/flutter_html.dart';

class DetailsMostPopularData extends StatelessWidget {

  final slug;

  DetailsMostPopularData( {required this.slug});


  Future<MostPopularDataDetailsModel> getData() async{

    http.Response response;

    await slug;

    response  = await http.get(Uri.parse('https://maakview.com/api/v1/product/details/$slug'));

    if(response.statusCode == 200){
      return MostPopularDataDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load');
    }

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MostPopularDataDetailsModel>(
      future: getData(),
      builder: (context,snapshot){

        final data = snapshot.data;

        if(snapshot.hasData){
          return buildDetailsData(data!);
        } else if(snapshot.hasError){
          return Text('${snapshot.hasError}');
        }

        return Center(child: const CircularProgressIndicator());

      },
    );
  }

  Widget buildDetailsData(MostPopularDataDetailsModel mostPopularDataDetailsModel){

    var data = mostPopularDataDetailsModel.data;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Image.network(data.thumbnailImage,fit: BoxFit.cover,),

            Row(children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],

                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.indigo, width: 5),
                        right: BorderSide(color: Colors.indigo, width: 5),
                        top: BorderSide(color: Colors.indigo, width: 5),
                        bottom: BorderSide(color: Colors.indigo, width: 5),
                      )
                    ),

                    child: Image.network(data.brand.logo),

                  ),


                ),


              ),

              SizedBox(width: 20,),

              Column(
                children: [
                  Text('Brand Name',style: TextStyle(fontWeight: FontWeight.w600,fontSize:15,color: Colors.grey),),
                  Text(data.brand.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),)
                ],
              ),


              Spacer(),

              ElevatedButton(onPressed: (){

                //context.read<CartProvider>().addCounter();

                //print('hello');
                //print(value.counter);


              },
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart,size: 18,),
                    Text('Add to cart',style: TextStyle(fontSize: 10),),
                  ],
                ),
              )


            ],),

            Html(data: data.description.toString()),

          ],
        ),
      ),
    );

  }

}
