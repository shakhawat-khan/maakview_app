import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/home/flash_sale_model.dart';

import 'package:http/http.dart' as http ;

import '../../routes/routes.dart';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:provider/provider.dart';

import '../../../model/home/most_popular_model.dart';
import 'package:like_button/like_button.dart';

import '../../../model/home/most_popular_model.dart';
import '../../../provider/add_cart.dart';
import '../../../routes/routes.dart';

/*

* Here we use FlashSaleModel in laptop because both API send
* same kind of Json object
*
* */

class LaptopData extends StatelessWidget {

  Future<FlashSaleModel> getFlashSaleData()async{
    http.Response response;

    response = await http.get(Uri.parse('https://www.maakview.com/api/v1/setting/home/product_section_five'));

    if(response.statusCode ==200){
      return FlashSaleModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }


  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();

    return  Container(
      child: FutureBuilder<FlashSaleModel> (
        future: getFlashSaleData(),
        builder: (context,snapshot){
          final data  = snapshot.data;

          if(snapshot.hasData){
            return buildFlashSale(data!);
          } else if (snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return Center(child: const CircularProgressIndicator());

        },
      ),
    );
  }

  Widget buildFlashSale(FlashSaleModel flashSaleModel){
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    final ScrollController _controller = ScrollController();


    return Container(
      height: 270,
      width: double.infinity,
      child: ListView.builder(
          controller:  _controller,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: flashSaleModel.data.products.data.length,
          itemBuilder: (context,index){
            final data = flashSaleModel.data.products.data[index];
            final discount1 = (data.baseDiscountedPrice/data.basePrice)*100 ;
            final discount = (100-discount1).ceil();

            return Container(

              child: data.basePrice==data.baseDiscountedPrice? InkWell(
                onTap: (){

                  Navigator.of(context).pushNamed(RouteManager.most_popular_product_details,arguments: {'slug' : data.slug });

                },
                child: Container(

                  width: 165,

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
                              LikeButton(size: 15,)
                            ],
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                              height: 30,
                              child: Text(data.name,style: TextStyle(fontSize: 10,color: Colors.grey),overflow:TextOverflow.ellipsis,maxLines: 2,)
                          ),
                          //SizedBox(height: 10,),
                          Spacer(),
                          Container(height: 20,width: 105,
                              child: Consumer<CartProvider>(
                                builder: (context,value,child){
                                  return ElevatedButton(onPressed: (){

                                    //context.read<CartProvider>().addCounter();

                                    //print('hello');
                                    //print(value.counter);

                                    value.checkCart(data.id);

                                    context.read<CartProvider>().addProductCart(data.thumbnailImage,data.name,data.baseDiscountedPrice,1,data.id,data.baseDiscountedPrice);

                                    Fluttertoast.showToast(msg: '${value.addCart_check}' ,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.grey);

                                  },
                                    child: Row(
                                      children: [
                                        Icon(Icons.shopping_cart,size: 15,),
                                        Text('Add to cart',style: TextStyle(fontSize: 10),),
                                      ],
                                    ),
                                  );
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
                  : InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RouteManager.most_popular_product_details,arguments: {'slug' : data.slug });
                },
                child: Container(

                  width: 150,

                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //alignment: Alignment.topLeft,
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

                            Container(
                              child: Image.network(data.thumbnailImage,height: 140,width: 100,),
                              alignment: Alignment.center,
                            ),

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('৳'+'${oCcy.format(data.basePrice)}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.lineThrough)),
                        ),

                        Row(
                          children: [

                            Padding(

                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('৳',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            ),
                            Text('${oCcy.format(data.baseDiscountedPrice)}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            //Text(data.basePrice.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            SizedBox(width:25 ,),
                            LikeButton(size: 15,)
                          ],
                        ),
                        //SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                          child: SizedBox(
                              height: 30,
                              child: Text(data.name,style: TextStyle(fontSize: 10,color: Colors.grey),overflow:TextOverflow.ellipsis,maxLines: 2,)
                          ),
                        ),

                        SizedBox(height: 3,),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(height: 20,width: 102,
                              child: Consumer<CartProvider>(
                                builder: (context,value,child){
                                  return ElevatedButton(onPressed: (){

                                    //context.read<CartProvider>().addCounter();
                                    //print('hello');
                                    //print(value.counter);

                                    value.checkCart(data.id);

                                    context.read<CartProvider>().addProductCart(data.thumbnailImage,data.name,data.baseDiscountedPrice,1,data.id,data.baseDiscountedPrice,);

                                    Fluttertoast.showToast(msg: '${value.addCart_check}' ,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.grey);


                                  },
                                    child: Row(
                                      children: [
                                        Icon(Icons.shopping_cart,size: 15,),
                                        Text('Add to cart',style: TextStyle(fontSize: 9),),
                                      ],
                                    ),
                                  );
                                },
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ) ,
            );

          }
      ),
    );
  }
}
