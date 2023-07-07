import 'package:dio/dio.dart';
import 'package:ecommerce/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'common/textfiled.dart';
import 'model/product_model.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  State<Addproduct> createState() => _AddproductState();
}

String dropdownvalue = "";

var item = [
  "1",
  "2",
  "3",
  "4",
  "5",
];

class _AddproductState extends State<Addproduct> {
  productModel productmodelll = productModel();
  TextEditingController productnameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  String seletedImagespath = "";
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
                label: 'Productname',
                obscureText: false,
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextfiled(obscureText: false, label: 'Category'),
              const SizedBox(
                height: 15,
              ),
              /*AppTextfiled(obscureText: false,
                 label: 'Comapany Name'),*/
              /* Container(
                width: 320,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 1.2),
                    ],
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),

                    value: dropdownvalue,
                    items: item.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      print("data:->${value}");
                      setState(() {
                        dropdownvalue = value.toString();
                      });
                    },
                  ),
                ),
              ),*/

              const SizedBox(
                height: 15,
              ),
              AppTextfiled(
                  maxLines: 5,
                  minLines: 120,
                  obscureText: false,
                  label: 'Description'),
              const SizedBox(
                height: 15,
              ),
              AppTextfiled(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: 'Price'),
              const SizedBox(
                height: 15,
              ),
              AppTextfiled(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: 'Qty'),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 225, bottom: 10),
                child: Text("Upload Image:"),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
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
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? f =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {});
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
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(350, 40)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetProduct(),
                        ));
                  },
                  child: const Text("SAVE")),
            ],
          ),
        ),
      ),
    );
  }

  void addproduct(productModel Product) async {
    try {
      Map<String, dynamic> body = {
        'id': Product.id,
        'product_name': productnameCtrl,
        'category_id': Product.categoryId,
        'description': descriptionCtrl,
        'price': priceCtrl,
        'qty': qtyCtrl,
        'product_img': Product.productImg,
      };
      var response = await Dio().post(
          "https://testecommerce.equitysofttechnologies.com/product/add",
          queryParameters: body);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
