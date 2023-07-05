import 'package:dio/dio.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  TextEditingController namecategoryCtrl = TextEditingController();
  CategoryModel categoryModel = CategoryModel();
  List<Category> categorylist = [];

  @override
  void initState() {
    super.initState();
    getcategory();
  }

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
              controller: namecategoryCtrl,
              decoration: InputDecoration(
                  label: const Text("Category"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
                addcategory();
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(320, 45)),
              child: const Text("ADD")),
          const Padding(
            padding: EdgeInsets.only(top: 25, right: 220),
            child: Text("List of categories"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categorylist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(categorylist[index].categoryName,
                                style: TextStyle(color: Colors.white)),
                          ),
                          Row(
                            children: [
                              Icon(Icons.edit, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  } //ghj

  void getcategory() async {
    try {
      var response = await Dio()
          .get("http://testecommerce.equitysofttechnologies.com/category/get");
      print("dhdhdhdhdhdhdhdhdhdhd================>${response.data}");
      //category: List<Category>.from((json['r']??[]).map((e)=>Category.fromjson(e)))
      // categorylist = List<Category>.from(response.data['r'].map((e)=>Category.fromjson(e)));
      categoryModel = CategoryModel.fromjson(response.data);
      categorylist = categoryModel.category;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void addcategory() async {
    try {
      Map<String, dynamic> body = {'category_name': namecategoryCtrl.text};
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/category/add",
          data: body);
      setState(() {});
      print("dfdff--->${response.data}");
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}