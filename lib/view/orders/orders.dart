import 'package:flutter/material.dart';
import 'package:maakview_app/provider/add_cart.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';

import 'package:fluttericon/elusive_icons.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;


    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Consumer<CartProvider>(
              builder: (context,value,child){
                return value.orderView_list.length==0 ? Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset('assets/order/no_cart.jpg',fit: BoxFit.cover,),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Your shopping bag is empty. Start shopping.',style: TextStyle(
                        //fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),),
                    ),
                  ],

                ) : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: value.orderView_list.length,
                    itemBuilder: (context,index)
                    {


                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Image.network(value.orderView_list[index].card_image,width: 50,height: 50,),

                            ],
                          ),
                          title: Text(value.orderView_list[index].card_name,style: TextStyle(fontSize: 10),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('৳ '+value.orderView_list[index].all_price.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                              IconButton(onPressed: () {
                                value.deleteCart(index);
                              }, icon: const Icon(Icons.delete,color: Colors.red,)),

                            ],
                          ),
                          subtitle: Consumer<CartProvider>(
                            builder: (context,value,child){
                              return Row(
                                children: [
                                  InkWell(
                                      onTap: (){

                                        //value.test[index].quantity++;
                                        //print(value.test[index].quantity);
                                        value.decreaseQuantity(index);
                                        value.totalPrice(index);


                                      },

                                      child: Icon(Elusive.minus_circled,size: 18,color: Colors.indigo,)
                                  ),
                                  SizedBox(width: 10,),
                                  Text(value.orderView_list[index].quantity.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,maxLines: 2,),
                                  SizedBox(width: 10,),
                                  InkWell(
                                      onTap: (){

                                        //value.test[index].quantity--;

                                        //print(object)

                                        value.increseQuantity(index);
                                        value.totalPrice(index);


                                      },
                                      child: Icon(Elusive.plus_circled,size: 18,color: Colors.indigo,)
                                  )
                                ],
                              );
                            },

                          ),

                        ),
                      );
                    }

                );
              },
            ),
          ],
        ),
      ),

      persistentFooterButtons: [
        Consumer<CartProvider>(
            builder: (context,value,child){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Total Amount'),
                  Container(child: Text('৳ '+value.total_price.toString(),style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                  ),)),
                  IconButton(
                    icon: Icon(Icons.payment_outlined),
                    onPressed: (){

                      //Navigator.of(context).pushNamed(RouteManager.payment);


                    },
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushNamed(RouteManager.pos);

                  }, child: Text('CHECK OUT'))
                ],
              );
            }

        )
      ],


    );
  }
}
