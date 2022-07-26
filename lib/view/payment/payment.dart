import 'package:flutter/material.dart';

import '../../routes/routes.dart';
enum SingingCharacter { CashOnDelivery, Bkash }
class Payment extends StatefulWidget {

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  SingingCharacter? _character = SingingCharacter.CashOnDelivery;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('payment'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[


            Image.asset('assets/onBoarding_screen/maakview_logo.png'),

            SizedBox(height: 25,),



            ListTile(
              title: const Text('Cash On Delivery'),
              leading: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Radio<SingingCharacter>(

                    value: SingingCharacter.CashOnDelivery,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                        //print(_character);
                      });
                    },
                  ),


                  Image.asset('assets/payment/cash.png')

                ],
              ),
            ),

            SizedBox(height: 20,),

            ListTile(
              title: const Text('Bkash'),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<SingingCharacter>(
                    value: SingingCharacter.Bkash,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                        //print(_character);
                      });
                    },
                  ),
                  Image.asset('assets/payment/bkash.png')
                ],
              ),
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!

            print(_character);


            if(_character==SingingCharacter.Bkash){
              print('bkash chole');
              Navigator.of(context).pushNamed(RouteManager.bkash);

            }else if(_character==SingingCharacter.CashOnDelivery){
              print('Cash on delivery chole');
              Navigator.of(context).pushNamed(RouteManager.cash_on_delivery);
            }

          },
          label: const Text('Approve'),
          icon: const Icon(Icons.done),
          backgroundColor: Colors.indigo,
        ),
    );
  }
}
