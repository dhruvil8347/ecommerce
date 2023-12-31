import 'package:dio/dio.dart';
import 'package:ecommerce/main.dart';
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
  CategoryList categorymodelll = CategoryList();
  List<CategoryList> categorylist = [];
  bool isLoding = false;
  bool isEdit = false;
  final formkey = GlobalKey<FormState>();

  bool validate = false;

  @override
  void initState() {
    super.initState();
    getcategory();
    isEdit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Category")),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "*required categoryname ";
                  }
                  return null;
                },
                controller: namecategoryCtrl,
                decoration: InputDecoration(
                    label: const Text("Category"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  categorymodelll.categoryName = namecategoryCtrl.text.trim();
                  if (categorymodelll.categoryName != 0) {
                    editcategory(categorymodelll);
                  } else {
                    addcategory();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(320, 45)),
              child: Text("ADD")),
          SizedBox(
            height: 5,
          ),
          /* ElevatedButton(
              onPressed: () {
                categorymodelll.categoryName = namecategoryCtrl.text;
                if (categorymodelll.id != 0) {
                  editcategory(categorymodelll);
                }
                namecategoryCtrl.clear();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(320, 45)),
              child: const Text("UPDATE")),*/

          /*Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),*/

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
                                  child: SizedBox(
                                    width: 220,
                                    child:
                                        Text(categorylist[index].categoryName,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          editcategory(
                                              categorymodelll = CategoryList(
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
      categorylist = List<CategoryList>.from(
          response.data['r'].map((e) => CategoryList.fromjson(e)));
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
      logger.d("dfdff--->${response.data}");
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void editcategory(CategoryList category) async {
    try {
      Map<String, dynamic> body = {
        'id': category.id,
        'category_name': category.categoryName
      };
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/category/update",
          data: body);
      print(response.data);
      categorymodelll = CategoryList();
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