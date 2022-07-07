import 'package:flutter/material.dart';
import 'package:maakview_app/provider/add_cart.dart';
import 'package:provider/provider.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Consumer<CartProvider>(
              builder: (context,value,child){
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: value.test.length,
                    itemBuilder: (context,index)
                    {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(value.test[index].card_image,width: 50,height: 50,),
                          title: Text(value.test[index].card_name,style: TextStyle(fontSize: 10),),
                          trailing: Text(value.test[index].card_price.toString()),
                          subtitle: Consumer<CartProvider>(
                            builder: (context,value,child){
                              return Row(
                                children: [
                                  InkWell(
                                      onTap: (){
                                        
                                        //value.test[index].quantity++;





                                      },

                                      child: Icon(Icons.chevron_left)
                                  ),
                                  Text(value.test[index].quantity.toString()),
                                  InkWell(
                                      onTap: (){

                                        //value.test[index].quantity--;

                                        //print(object)


                                      },
                                      child: Icon(Icons.chevron_right)
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
    );
  }
}

