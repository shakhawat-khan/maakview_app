import 'package:flutter/material.dart';
import 'package:maakview_app/provider/add_cart.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';

class Pos extends StatelessWidget {
  const Pos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),

      body: Consumer<CartProvider>(
        builder: (context,value,child){
          return SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 20,),
                  Image.asset('assets/onBoarding_screen/maakview_logo.png'),



                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: value.test.length,
                      itemBuilder: (context,index){
                      int yo = index+1;
                        return Container(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(child: Text((yo).toString())),
                                    Text('.'),
                                    SizedBox(width: 10,),
                                    Flexible(child: Text(value.test[index].card_name)),

                                    SizedBox(width: 20,),



                                    Text('Quantity no. '+value.test[index].quantity.toString()),

                                    Spacer(),

                                    Text('৳ '+value.test[index].all_price.toString())

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),

                  Card(
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('Total Amount'),
                        SizedBox(width: 20,),
                        Text('৳ '+value.total_price.toString())
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){

                    Navigator.of(context).pushNamed(RouteManager.payment);

                   }, child: Text(
                    'Confirm'
                  )),

                  SizedBox(height: 20,)

                ],
              ),
            ),
          );
        },
      )

    );
  }
}
