import 'package:dio/dio.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  TextEditingController nameCtrl = TextEditingController();
  CategoryModel categoryModel = CategoryModel();
  List<Category>  categorylist = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Category")),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  label: const Text("Category"),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
          ),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 45)
              ),
              child: const Text("ADD")),

          const Padding(
            padding: EdgeInsets.only(top: 25,right: 220),
            child: Text("List of categories"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: categorylist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categorylist[index].categoryName),
                );

            },),
          )
        ],
      ),
    );
  }

  void getcategory()async{
    try{
      var response = await Dio().get("http://testecommerce.equitysofttechnologies.com/category/get");
      print(response.data);
      categoryModel = CategoryModel.fromjson(response.data);
      categorylist = categoryModel.category;
      setState(() {
      });
    }catch(e){
      print(e);
    }
  }

  /*void addcategory()async{
    try{
      var re
    }catch(e){print(e);}*/
  }


