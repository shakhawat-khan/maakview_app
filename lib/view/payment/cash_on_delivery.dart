import 'package:flutter/material.dart';

class CashOnDelivery extends StatefulWidget {

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  String name = '';
  String phone_number = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Cash On Delivery'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,

              ),
              child: Form(child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                labelText: 'Name'
              ),

                onChanged: (value){
                  setState(() {
                    name = value.toString();
                    //print(value);
                  });
                },

              )
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,

              ),
              child: Form(child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    labelText: 'Phone Number'
                ),

                onChanged: (value){
                  setState(() {
                    phone_number = value.toString();
                    //print(value);
                  });
                },

              )
              ),
            ),

            SizedBox(height: 10,),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,

              ),
              child: Form(child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Adress',
                    labelText: 'Adress'
                ),

                onChanged: (value){
                  setState(() {
                    address = value.toString();
                    //print(value);
                  });
                },

              )
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: (){},
                child: Text('Submit')
            )

          ],
        ),
      )

    );
  }
}
