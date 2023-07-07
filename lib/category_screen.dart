import 'package:dio/dio.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  TextEditingController namecategoryCtrl = TextEditingController();
  CategoryModel categoryModel = CategoryModel();
  Category categorymodelll = Category();
  List<Category> categorylist = [];
  bool isLoding = false;

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
                addcategory();
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(320, 45)),
              child: const Text("ADD")),
          ElevatedButton(
              onPressed: () {
                categorymodelll.categoryName = namecategoryCtrl.text;
                if (categorymodelll.id > 0) {
                  editcategory(categorymodelll);
                }
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(320, 45)),
              child: const Text("UPDATE")),
          const Padding(
            padding: EdgeInsets.only(top: 25, right: 220),
            child: Text("List of categories"),
          ),
          Expanded(
            child: isLoding
                ? Lottie.asset("assets/lottie/a.json")
                : ListView.builder(
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
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          editcategory(
                                              categorymodelll = Category(
                                            id: categorylist[index].id,
                                            categoryName: categorylist[index]
                                                .categoryName,
                                          ));
                                          namecategoryCtrl.text =
                                              categorylist[index].categoryName;
                                        },
                                        child: const Icon(Icons.edit,
                                            color: Colors.white)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          deletecategory(
                                              categorylist[index].id);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
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
      isLoding = true;
      var response = await Dio()
          .get("http://testecommerce.equitysofttechnologies.com/category/get");
      print("dhdhdhdhdhdhdhdhdhdhd================>${response.data}");
      //category: List<Category>.from((json['r']??[]).map((e)=>Category.fromjson(e)))
      // categorylist = List<Category>.from(response.data['r'].map((e)=>Category.fromjson(e)));
      /* categoryModel = CategoryModel.fromjson(response.data);*/
      /*categorylist = categoryModel.category;*/
      setState(() {
        isLoding = false;
      });
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
      setState(() {
        getcategory();
      });
      print("dfdff--->${response.data}");
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void editcategory(Category category) async {
    try {
      Map<String, dynamic> body = {
        'id': category.id,
        'category_name': category.categoryName
      };
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/category/update",
          data: body);
      print(response.data);

      setState(() {
        getcategory();
      });
    } catch (e) {
      print(e);
    }
  }

  void deletecategory(int id) async {
    try {
      Map<String, dynamic> body = {'id': id};
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/category/delete",
          data: body);
      print(response.data);
      setState(() {
        getcategory();
      });
    } catch (e) {
      print(e);
    }
  }
}