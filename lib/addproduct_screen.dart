import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'common/textfiled.dart';
import 'model/company_model.dart';
import 'model/product_model.dart';

class Addproduct extends StatefulWidget {
  Addproduct({Key? key, required this.productListModel}) : super(key: key);

  final productModel productListModel;

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  // productModel productmodelll = productModel();
  TextEditingController productnameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();

  List<String> selectedImages = [];
  final ImagePicker picker = ImagePicker();

  List<Company> comapanyList = [];
  List<CategoryList> categoryListt = [];
  List<productModel> productlist = [];

  int? categoryValue;
  int? companyValue;
  String imageUrl =
      "https://testecommerce.equitysofttechnologies.com/uploads/product_img/";
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if (widget.productListModel.id > 0) {
      productnameCtrl.text = widget.productListModel.productName;
      descriptionCtrl.text = widget.productListModel.description;
      qtyCtrl.text = widget.productListModel.qty.toString();
      categoryValue = widget.productListModel.categoryId;
      companyValue = widget.productListModel.companyId;
      selectedImages =
          widget.productListModel.productImg.map((e) => e.productImgg).toList();
      priceCtrl.text = widget.productListModel.price.toString();

      isEdit = true;
    }
    getCompany();
    getCategory();
  }

  productModel productmodel = productModel();

  @override
  Widget build(BuildContext context) {
    getCompany();
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit product" : "Add Product"),
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
                    padding: const EdgeInsets.only(left: 15),
                    value: categoryValue,
                    borderRadius: BorderRadius.circular(10),
                    hint: const Padding(
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
                    padding: const EdgeInsets.only(left: 15),
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
                      height: 60,
                      child: selectedImages.isEmpty
                          ? const Center(
                              child: Text(
                              "Image not found",
                              style: TextStyle(color: Colors.red),
                            ))
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
                                    child: !selectedImages[index]
                                            .contains("data/user")
                                        ? Image.network(
                                            imageUrl + selectedImages[index],
                                          )
                                        : Image.file(
                                            File(selectedImages[index]),
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
                    print('UPDATE:::::::::::${widget.productListModel.id}');
                    /*   widget.productListModel.id > 0 & productmodel.id == 0
                        ? addProduct()
                        : editProduct(productModel(
                            id: widget.productListModel.id,
                            productName: productnameCtrl.text,
                            description: descriptionCtrl.text,
                            price: double.parse(priceCtrl.text),
                            qty: int.parse(qtyCtrl.text),
                            categoryId: categoryValue ?? 0,
                            companyId: companyValue ?? 0,
                          ));*/

                    if (widget.productListModel.id > 0) {
                      editProduct(productModel(
                        id: widget.productListModel.id,
                        productName: productnameCtrl.text,
                        description: descriptionCtrl.text,
                        price: double.parse(priceCtrl.text),
                        qty: int.parse(qtyCtrl.text),
                        categoryId: categoryValue ?? 0,
                        companyId: companyValue ?? 0,
                      ));
                    } else if (productmodel.id > 0) {
                      print("your product add successfully");
                    } else {
                      addProduct();
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(isEdit ? "Update" : "SAVE")),
            ],
          ),
        ),
      ),
    );
  }

  void editProduct(productModel product) async {
    try {
      Map<String, dynamic> body = {
        'id': product.id,
        'product_name': product.productName,
        'company_id': product.companyId,
        'category_id': product.categoryId,
        'qty': product.qty,
        'description': product.description,
        'price': product.price,
      };
      var respose = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/product/update",
          data: body);
      setState(() {});
      print(respose.data);
    } catch (e) {
      print(e);
    }
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
            selectedImages[i],
            filename: selectedImages[i].split("/").last,
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
      setState(() {});
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
            logger.w(xfilePick[i].path);
            selectedImages.add(xfilePick[i].path);
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
