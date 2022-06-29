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
                    itemCount: value.order_view.length,
                    itemBuilder: (context,index)
                    {
                      return Card(
                        elevation: 5,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: Text(value.order_view[index]),
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
