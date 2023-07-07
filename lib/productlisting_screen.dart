import 'package:dio/dio.dart';
import 'package:ecommerce/addproduct_screen.dart';
import 'package:flutter/material.dart';

import 'model/product_model.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}


class _ProductState extends State<Product> {
/*  productModel model = productModel();*/
  List<product> productList = [];

  @override
  void initState() {
    super.initState();
    getproduct();
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
              child: ListView.builder(
                itemCount: 1,

                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 130,
                        width: 330,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Container(
                                height: 80,
                                width: 80,
                                color: Colors.grey,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 12),
                                child: Column(
                                  children: [
                                    Text("dd", style: TextStyle(height: 2)),
                                    Text("category"),
                                    Text("Qty"),
                                  ],
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
                                  ElevatedButton(onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(80, 30)
                                      ),
                                      child: Text("SAVE")),

                                  ElevatedButton(onPressed: () {

                                  },
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(80, 30)
                                      ),
                                      child: Text("DELETE")),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },),
            )

          ],
        ),
      ),
    );
  }

  void getproduct() async {
    try {
      var response = await Dio().get(
          "https://testecommerce.equitysofttechnologies.com/product/get");
      print(response.data);
      productList = List<pr>
    } catch (e) {
      print(e);
    }
  }

  void deleteproduct() async {
    try {} catch (e) {
      print(e);
    }
  }

}
