import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'common/textfiled.dart';
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

  String seletedImagespath0 = "";
  String seletedImagespath1 = "";
  String seletedImagespath2 = "";
  String seletedImagespath3 = "";

  List<File> selectedImages = [];
  final ImagePicker picker = ImagePicker();

  String valuechoose0 = "10";
  List items0 = [
    "Company name",
    "10",
    "11"
        "12"
  ];

  String valuechoose = "Category name";
  List items = [
    "Category name",
    "2",
    "3",
    "4",
    "5",
  ];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

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
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    value: valuechoose0,
                    items: items0.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      print("data:->${value}");
                      setState(() {
                        valuechoose0 = value.toString();
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              /*AppTextfiled(obscureText: false,
                 label: 'Comapany Name'),*/
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
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    value: valuechoose,
                    items: items.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      print("data:->${value}");
                      setState(() {
                        valuechoose = value.toString();
                      });
                    },
                  ),
                ),
              ),
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
              /*SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? a =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          final File imagefile = File(a!.path);
                          seletedImagespath1 = imagefile.path;
                        });
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
                        child:
                        seletedImagespath1!=""
                            ? Image.file(File(seletedImagespath1),fit: BoxFit.cover,
                        )
                        :Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? f =
                        await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          final File imagefile = File(f!.path);
                          seletedImagespath0 = imagefile.path;
                        });
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

                        child:

                        seletedImagespath0!=""
                            ? Image.file(File(seletedImagespath0),fit: BoxFit.cover,
                        ):
                            Icon(Icons.add)
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
                  ],
                ),
              ),*/
              /*Container(
                height: 52,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: ()
                          {
                            getImages();
                          },
                          child: Container(
                            height: 60,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 1.2,
                                      color: Colors.grey,
                                      blurStyle: BlurStyle.outer)
                                ]),
                            child:

                            Icon(Icons.add),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  },
                ),
              ),*/
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
                          ? Center(child: Text('Sorry nothing selected!!'))
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
              const SizedBox(height: 20),
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
        'product_img[0]': selectedImages.toList(),
      };
      var response = await Dio().post(
          "https://testecommerce.equitysofttechnologies.com/product/add",
          queryParameters: body);
      print(response.data);
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
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
