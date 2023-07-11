import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'common/textfiled.dart';
import 'model/company_model.dart';
import 'model/product_model.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  productModel productmodelll = productModel();
  TextEditingController productnameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();

  List<File> selectedImages = [];
  final ImagePicker picker = ImagePicker();

  List<Company> comapanyList = [];
  List<CategoryList> categoryListt = [];
  int? categoryValue;
  int? companyValue;

  @override
  void initState() {
    super.initState();
    getCompany();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    getCompany();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextfiled(
                controller: productnameCtrl,
                label: 'Productname',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 1.2),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    padding: EdgeInsets.only(left: 15),
                    value: categoryValue,
                    borderRadius: BorderRadius.circular(10),
                    hint: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("category"),
                    ),
                    items: categoryListt.map((e) {
                      return DropdownMenuItem<int>(
                          value: e.id, child: Text(e.categoryName));
                    }).toList(),
                    onChanged: (value) {
                      print("data:->${value}");
                      setState(() {
                        categoryValue = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 1.2),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    padding: EdgeInsets.only(left: 15),
                    value: companyValue,
                    borderRadius: BorderRadius.circular(10),
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Company"),
                    ),
                    items: comapanyList.map((e) {
                      return DropdownMenuItem<int>(
                          value: e.id, child: Text(e.companyName));
                    }).toList(),
                    onChanged: (value) {
                      print("data:->${value}");
                      setState(() {
                        companyValue = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextfiled(
                  controller: descriptionCtrl,
                  maxLines: 5,
                  minLines: 120,
                  obscureText: false,
                  label: 'Description'),
              AppTextfiled(
                  controller: priceCtrl,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: 'Price'),
              AppTextfiled(
                  controller: qtyCtrl,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: 'Qty'),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 225, bottom: 10),
                child: Text("Upload Image:"),
              ),
              GestureDetector(
                onTap: () {
                  getImages();
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 1.2,
                            color: Colors.grey,
                            blurStyle: BlurStyle.outer),
                      ]),
                  child: const Icon(Icons.add),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: selectedImages.isEmpty
                          ? Image.asset(
                              "assets/images/not.png",
                              scale: 7,
                            )
                          : GridView.builder(
                              itemCount: selectedImages.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 1.2,
                                      color: Colors.grey,
                                      blurStyle: BlurStyle.outer)
                                ],
                              ),
                              child: kIsWeb
                                  ? Image.network(
                                selectedImages[index].path,
                              )
                                  : Image.file(
                                selectedImages[index],
                                fit: BoxFit.cover,
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(fixedSize: const Size(350, 40)),
                  onPressed: () {
                    addProduct();
                  },
                  child: const Text("SAVE")),
            ],
          ),
        ),
      ),
    );
  }

  void addProduct() async {
    try {
      Map<String, dynamic> body = {
        'product_name': productnameCtrl.text,
        'description': descriptionCtrl.text,
        'price': priceCtrl.text,
        'qty': qtyCtrl.text,
        'category_id': categoryValue,
        'company_id': companyValue,
      };
      for (int i = 0; i < selectedImages.length; i++) {
        body.addAll({
          'product_img[$i]': await MultipartFile.fromFile(
            selectedImages[i].path,
            filename: selectedImages[i].path.split("/").last,
          )
        });
      }
      /*  Map<String, dynamic> img =
     {
      'product_img' : mulitiselectedImages,
     };*/

      FormData data = FormData.fromMap(body);
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/product/add",
          data: data);
      print(response);
    } catch (e) {
      print(e);
      if (e is DioException) {
        print(e.response);
      }
    }
  }

  void getCompany() async {
    try {
      var response = await Dio()
          .get("http://testecommerce.equitysofttechnologies.com/company/get");
      print(response.data);
      comapanyList = List<Company>.from(
          response.data['r'].map((e) => Company.fromJson(e)));
    } catch (e) {
      print(e);
    }
  }

  void getCategory() async {
    try {
      var response = await Dio()
          .get("http://testecommerce.equitysofttechnologies.com/category/get");
      print(response.data);
      categoryListt = List<CategoryList>.from(
          response.data['r'].map((e) => CategoryList.fromjson(e)));
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'Nothing is selected!',
            style: TextStyle(
              color: Colors.red,
            ),
          )));
        }
      },
    );
  }
}
