import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maakview_app/provider/from_login_to_responsePhoneNumber.dart';
import 'package:maakview_app/view/bottom_navBar/bottom_nav.dart';
import 'package:maakview_app/view/user_address/update_done_address_create.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}


class _AddAddressState extends State<AddAddress> {

  List categoryItemlist = [
    {"id": 7264,
    "name": "Bandarban"},
    {"id": 7266,
    "name": "Barisal",},
    {
      "id": 7267,
      "name": "Gaurnadi",
    },
    {"id": 7268,
      "name": "Mehendiganj",},
    {
      "id": 7269,
      "name": "Nalchiti",
    },
    {
      "id": 7270,
      "name": "Bhola",
    },

    {
      "id": 7271,
      "name": "Burhanuddin",
    },
    {
      "id": 7276,
      "name": "Sherpur",
    },
    {
      "id": 7277,
      "name": "Chandpur",
    },
    {
      "id": 7280,
      "name": "Chattagam",
    },

    {
      "id": 7289,
      "name": "Chuadanga",
    },
    {
      "id": 7293,
      "name": "Dohar",
    },
    {
      "id": 7295,
      "name": "Dinajpur",
    },

    {
      "id": 7300,
      "name": "Faridpur",
    },
    {
      "id": 7302,
      "name": "Feni",
    },
    {
      "id": 7304,
      "name": "Gazipur",
    },

    {
      "id": 7306,
      "name": "Gopalganj",
    },

    {
      "id": 7309,
      "name": "Habiganj",
    },
    {
      "id": 7310,
      "name": "Jamalpur",
    },
    {
      "id": 7313,
      "name": "Jessor",
    },
    {
      "id": 7324,
      "name": "Khulna",
    },
    {
      "id": 7333,
      "name": "Kurigram",
    },
    {
      "id": 7337,
      "name": "Kushtia",
    },
    {
      "id": 7338,
      "name": "Lakshmipur",
    },
    {
      "id": 7342,
      "name": "Madaripur",
    },
    {
      "id": 7343,
      "name": "Magura",
    },
    {
      "id": 7351,
      "name": "Manikganj",
    },
    {
      "id": 7352,
      "name": "Meherpur",
    },
    {
      "id": 7353,
      "name": "Munshiganj",
    },
    {
      "id": 7356,
      "name": "Narayanganj",
    },
    {
      "id": 7358,
      "name": "Narsingdi",
    },
    {
      "id": 7364,
      "name": "Nawabganj",
    },
    {
      "id": 7366,
      "name": "Netrakona",
    },
    {
      "id": 7368,
      "name": "Nilphamari",
    },
    {
      "id": 7371,
      "name": "Noakhali",
    },
    {
      "id": 7376,
      "name": "Pabna",
    },
    {
      "id": 7377,
      "name": "Panchagarh",
    },
    {
      "id": 7378,
      "name": "Patuakhali",
    },
    {
      "id": 7382,
      "name": "Pirojpur",
    },
    {
      "id": 7384,
      "name": "Rajbari",
    },
    {
      "id": 7385,
      "name": "Rajshahi",
    },
    {
      "id": 7390,
      "name": "Rangpur",
    },
    {
      "id": 7391,
      "name": "Satkhira",
    },
    {
      "id": 7396,
      "name": "Shahjadpur",
    },
    {
      "id": 7397,
      "name": "Sirajganj",
    },
    {
      "id": 7399,
      "name": "Sunamganj",
    },
    {
      "id": 7405,
      "name": "Thakurgaon",
    },
    {
      "id": 48357,
      "name": "Uttara",
    },
    {
      "id": 48359,
      "name": "Sylhet",
    },
    {
      "id": 48360,
      "name": "Mymensingh",
    },
    {
      "id": 48361,
      "name": "Comilla",
    },
    {
      "id": 48362,
      "name": "Bogra",
    },
    {
      "id": 48363,
      "name": "Tangail",
    },
    {
      "id": 48364,
      "name": "Jhalokati",
    },
    {
      "id": 48365,
      "name": "Jhenaidah",
    },
    {
      "id": 48366,
      "name": "Narail",
    },
    {
      "id": 48367,
      "name": "Lalmonirhat",
    },
    {
      "id": 48368,
      "name": "Gaibandha",
    },
    {
      "id": 48369,
      "name": "Bagerhat",
    },
    {
      "id": 48370,
      "name": "Joypurhat",
    },
    {
      "id": 48371,
      "name": "Natore",
    },
    {
      "id": 48372,
      "name": "Naogaon",
    },
    {
      "id": 48373,
      "name": "Khagrachhari",
    },
    {
      "id": 48374,
      "name": "Brahmanbaria",
    },
    {
      "id": 48375,
      "name": "Cox's Bazar",
    },
    {
      "id": 48376,
      "name": "Moulvibazar",
    },

    {
      "id": 48377,
      "name": "Shariatpur",
    },

    {
      "id": 48378,
      "name": "Kishoreganj",
    },

    {
      "id": 48379,
      "name": "Demra",
    },
    {
      "id": 48380,
      "name": "Dhaka Cantt",
    },
    {
      "id": 48381,
      "name": "Dhanmondi",
    },
    {
      "id": 48382,
      "name": "Gulshan",
    },
    {
      "id": 48383,
      "name": "Jatrabari",
    },
    {
      "id": 48386,
      "name": "Khilgaon",
    },
    {
      "id": 48387,
      "name": "Khilkhet",
    },
    {
      "id": 48388,
      "name": "Lalbag",
    },
    {
      "id": 48389,
      "name": "Mirpur",
    },
    {
      "id": 48390,
      "name": "Mohammadpur",
    },
    {
      "id": 48391,
      "name": "Motijheel",
    },

    {
      "id": 48393,
      "name": "New market",
    },

    {
      "id": 48394,
      "name": "Palton",
    },
    {
      "id": 48395,
      "name": "Ramna",
    },

    {
      "id": 48396,
      "name": "Sabujbag",
    },
    {
      "id": 48398,
      "name": "Sutrapur",
    },

    {
      "id": 48399,
      "name": "Tejgaon",
    },

    {
      "id": 48405,
      "name": "Savar",
    },
    {
      "id": 48406,
      "name": "Keraniganj",
    },

  ];

  final items = ['Keraniganj',"Savar","Tejgaon"];
  String? value;


/*  Future getAllCategory() async {
    var baseUrl = "https://gssskhokhar.com/api/classes/"; // ToDO: change the API here

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        //
         print(jsonData);
        categoryItemlist = jsonData;
        print(categoryItemlist);
      });
    }
  }*/

  // TODO:

  String? temp_string;
  @override
  Widget build(BuildContext context) {

    TextEditingController textFieldController2 = TextEditingController();

    var dropdownvalue;


    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),

      body: Consumer<LoginToHome>(

        builder: (context,value,child){

          return Column(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 20,),

              // TODO: set Dropdown menu API data

              DropdownButton<String>(
                value: temp_string,

                hint: Text('Choose City'),

                items: categoryItemlist.map((item) {
                  return DropdownMenuItem(
                    value: item['id'].toString(),
                    child: Text(item['name'].toString()),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {

                    temp_string=newVal.toString();
                    print(temp_string);
                  });
                },

              ),

              SizedBox(height: 20,),

              // TODO: remove this text field USE dropdown menu


              SizedBox(height: 20,),

              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: textFieldController2,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.abc_rounded,color: Colors.indigo,),
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

                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context, )=> UpdateDoneAddressCreate(id: value.id1 ,address:textFieldController2.text ,city:temp_string.toString() ,phone:value.number ,) )
                );

              }, child: Text('submit'))

            ],

          );
        },

      ),

    );
  }
}
