import 'package:flutter/material.dart';
import 'package:maakview_app/controller/address/cities.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:provider/provider.dart';

import '../../controller/address/list_address.dart';
import 'add_address.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({Key? key}) : super(key: key);

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {

  List<String> items = ['Dhaka','Barishal','Chattogram','Khulna','Rajshahi','Rangpur','Mymensingh','Sylhet'];

  String? selectedItem = 'Dhaka';

  TextEditingController textFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: Consumer<LoginToHome>(
        builder: (context,value,child){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,


            children: [
              ElevatedButton(onPressed: (){

                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context, )=> AddAddress()));

              },

                  child: Text('Add Address')),

              ListAddressData(id: value.id1.toString(),),

              CitiesAddressData(),


            ],
          );
        },

      )
    );
  }
}


/*
Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
children: [

Center(child: Icon(Icons.location_city_outlined,color: Colors.indigo,size: MediaQuery.of(context).size.width/2)),

Text('City' , style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26),),

Container(
width: MediaQuery.of(context).size.width/2,
child: DecoratedBox(

decoration: BoxDecoration(
color: Colors.white,
border: Border.all(color: Colors.black38,width: 3),
borderRadius: BorderRadius.circular(5),

),
child: DropdownButtonHideUnderline(
child: DropdownButton<String>(
value: selectedItem,

items: items.map((item) => DropdownMenuItem(
value: item,
child: Text('  '+item.toString()))).toList(),

onChanged: (item)=>setState(() {
selectedItem = item;
}),

),
),
),
),

Text('Address' , style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26),),

Container(
width: MediaQuery.of(context).size.width,
child: TextField(
controller: textFieldController,
decoration: InputDecoration(
labelText: 'Address',
prefixIcon: Icon(Icons.location_city,color: Colors.indigo,),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(20)),
borderSide: BorderSide(
color: Colors.grey,
),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(10.0)),
borderSide: BorderSide(color: Colors.indigo),
),
),
style: TextStyle(
fontSize: 18,
color: Colors.black,
),
),
),

SizedBox(height: 20,),

ElevatedButton(onPressed: (){

}, child: Text('Save Address '))





],
),
),*/
