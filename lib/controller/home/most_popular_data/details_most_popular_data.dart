import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/home/most_popular_details_model.dart';
import 'package:http/http.dart' as http ;

import 'package:flutter_html/flutter_html.dart';

import '../../../provider/add_cart.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

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
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    final discount1 = (data.baseDiscountedPrice/data.basePrice)*100 ;
    final discount = (100-discount1).ceil();

    return Container(

      child:  data.basePrice==data.baseDiscountedPrice ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Image.network(data.thumbnailImage,fit: BoxFit.cover,),

              Row(
                children: [
                  Text('Price',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),

                  SizedBox(width: 10,),

                  Text('৳'+'${oCcy.format(data.baseDiscountedPrice)}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: 10,),

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

                Consumer<CartProvider>(
                  builder: (context,value,child){
                    return ElevatedButton(onPressed: (){

                      //context.read<CartProvider>().addCounter();

                      //print('hello');
                      //print(value.counter);

                      value.checkCart(data.id);

                      context.read<CartProvider>().addProductCart(data.thumbnailImage, data.name, data.baseDiscountedPrice, 1, data.id,data.baseDiscountedPrice);



                      Fluttertoast.showToast(msg: '${value.addCart_check}' ,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.grey);


                    },
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart,size: 18,),
                          Text('Add to cart',style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    );
                  },
                ),

              ],),

              Html(data: data.description.toString()),

            ],
          ),
        ),
      ): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.network(data.thumbnailImage,fit: BoxFit.cover,),

              SizedBox(height: 10,),

              Row(
                children: [
                  Container(
                      child: Text('Price  ' +'${oCcy.format(data.basePrice)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey,decoration: TextDecoration.lineThrough),),

                    alignment: Alignment.centerLeft,

                  ),

                  SizedBox(width: 20,),

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


              Row(
                children: [
                  //Text('Price' +'${oCcy.format(data.basePrice)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey,decoration: TextDecoration.lineThrough),),

                  Text('Discount Price',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),

                  SizedBox(width: 10,),

                  Text('৳'+'${oCcy.format(data.baseDiscountedPrice)}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: 10,),

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
                    borderRadius: BorderRadius.circular(5),
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

                Consumer<CartProvider>(
                  builder: (context,value,child){
                    return ElevatedButton(onPressed: (){

                      //context.read<CartProvider>().addCounter();

                      //print('hello');
                      //print(value.counter);
                      value.checkCart(data.id);

                      context.read<CartProvider>().addProductCart(data.thumbnailImage, data.name, data.baseDiscountedPrice, 1, data.id,data.baseDiscountedPrice);



                      Fluttertoast.showToast(msg: '${value.addCart_check}' ,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.grey);

                    },
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart,size: 18,),
                          Text('Add to cart',style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    );
                  },
                ),

              ],),

              Html(data: data.description.toString()),

            ],
          ),
        ),
      )

    );

  }

}
