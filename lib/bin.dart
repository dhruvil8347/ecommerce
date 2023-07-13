/*
import 'package:dio/dio.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/respons_model.dart';
import 'package:ecommerce/utils/network.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController namecategoryCtrl = TextEditingController();
  //CategoryModel categoryModel = CategoryModel();
  Category category = Category();
  List<Category> categorylist = [];

  @override
  void initState() {
    super.initState();
    getCategory();
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
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: namecategoryCtrl,
              onChanged: (value) {
                category.categoryName = value;
              },
              decoration: InputDecoration(
                  label: const Text("Category"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                category.id == 0
                    ? await addCategory()
                    : await editcompany(category);
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
                              GestureDetector(
                                  onTap: () {
                                    category = Category(
                                      categoryName:
                                      categorylist[index].categoryName,
                                      id: categorylist[index].id,
                                    );
                                    namecategoryCtrl.text =
                                        category.categoryName;
                                  },
                                  child: Icon(Icons.edit, color: Colors.white)),
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

  void getCategory() async {
    try {
      ResponseModel res = await network
          .get('http://testecommerce.equitysofttechnologies.com/category/get');
      if (res.status) {
        categorylist =
        List<Category>.from(res.data.map((e) => Category.fromJson(e)));
        setState(() {});
      } else {
        throw res.message;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addCategory() async {
    try {
      Map<String, dynamic> body = {'category_name': namecategoryCtrl.text};
      namecategoryCtrl.clear();
      ResponseModel res = await network.post(
          'http://testecommerce.equitysofttechnologies.com/category/add', body);
      if (res.status) {
        categorylist.insert(0, Category.fromJson(res.data));
        setState(() {});
      } else {
        throw res.message;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> editcompany(Category category) async {
    Map<String, dynamic> body = {
      'id': category.id,
      'category_name': category.categoryName,
    };
    try {
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/category/update",
          queryParameters: body);
      setState(() {
        getCategory();
        category = Category();
      });
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
//asdfghjklkjhgfdsasdfghjklkjhgfdsa  dhruvil
*/
