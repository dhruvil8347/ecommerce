import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Category")),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("Category"),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
          ),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 45)
              ),
              child: Text("ADD")),

          Padding(
            padding: const EdgeInsets.only(top: 25,right: 220),
            child: Text("List of categories"),
          ),
        ],
      ),
    );
  }

  getcategory()async{
    try{
      var response = await Dio().get("http://testecommerce.equitysofttechnologies.com/category/get");
      print(response.data);

    }catch(e){print(e);}


  }
}
