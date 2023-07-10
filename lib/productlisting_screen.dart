import 'package:dio/dio.dart';
import 'package:ecommerce/addproduct_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'model/product_model.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}


class _ProductState extends State<Product> {
  List<productModel> productlist = [];
  bool isLoding = false;

  @override
  void initState() {
    super.initState();
    getproduct();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Product")),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addproduct(),));
                },
                child: Icon(Icons.add)),
          ),

        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(

          children: [
            Expanded(
              child: isLoding
                  ? Lottie.asset("assets/lottie/a.json")
                  : ListView.builder(
                      itemCount: productlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 130,
                          width: 330,
                          color: Colors.deepOrange,
                          child: Card(
                            elevation: 5,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey,
                                ),
                                /*
                        ListTile(
                            title: Text(productlist[index].productName),
                          ),*/
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  child: Container(
                                    width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(productlist[index].productName,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                        Text(
                                            "Qty ${productlist[index].qty.toString()}"),
                                        Text(
                                          "price \u{20B9}${productlist[index].price.toString()}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(80, 30)),
                                        child: Text("Edit")),
                                    ElevatedButton(
                                        onPressed: () {
                                          deleteProduct(productlist[index].id);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(80, 30)),
                                        child: Text("Delete")),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void getproduct() async {
    try {
      isLoding = true;
      var response = await Dio()
          .get("https://testecommerce.equitysofttechnologies.com/product/get");
      print(response.data);
      productlist = List<productModel>.from(
          response.data['r'].map((e) => productModel.fromJson(e)));
      setState(() {
        isLoding = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void deleteProduct(int id) async {
    try {
      Map<String, dynamic> body = {'id': id};
      var response = await Dio().post(
          "https://testecommerce.equitysofttechnologies.com/product/delete",
          data: body);
      print(response.data);
      setState(() {
        getproduct();
      });
    } catch (e) {
      print(e);
    }
  }
}
