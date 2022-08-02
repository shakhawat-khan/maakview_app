import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/home/viewall_categoreis_model.dart';
//import 'package:maakview/categories/categories_class.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<AllCategories> getCategories() async {
    http.Response response;

    response = await http
        .get(Uri.parse('https://www.maakview.com/api/v1/all-categories'));

    if (response.statusCode == 200) {
      return AllCategories.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('faild to load categories');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder<AllCategories>(
        future: getCategories(),
        builder: (context, snapshot) {
          final allCategories = snapshot.data;

          if (snapshot.hasData) {
            return buildCategories(allCategories!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildCategories(AllCategories allCategories) => ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCategories.data!.length,
      itemBuilder: (context, index) {
        final data = allCategories.data![index];

        //subtitle(allCategories, index)


        return Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(data.banner.toString(),height: 100,width: 150,),
                Text(data.name.toString()),
                Row(
                  children: [

                    Flexible(child: subtitle(allCategories, index)),

                  ],
                )

              ],
            ),
          )
        );
      });



  Widget subtitle(AllCategories allCategories, index) {

    return ListView.builder(
        shrinkWrap: true,
        //physics: BouncingScrollPhysics(),
        itemCount: allCategories.data?[index].children?.data?.length,
        itemBuilder: (context, index1) {
          final data1 = allCategories.data?[index].children?.data![index1];
          return Text(data1!.name.toString());
        });
  }
}