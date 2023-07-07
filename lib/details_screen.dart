import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/product_model.dart';

class GetProduct extends StatefulWidget {
  const GetProduct({Key? key}) : super(key: key);

  @override
  State<GetProduct> createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  List<productModel> productList = [];
  productModel model = productModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 180,
              width: 342,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
            const Row(
              children: [
                Text("LG LCD Monitor",
                    style: TextStyle(fontSize: 15, height: 3)),
                SizedBox(width: 120),
                Text(
                  "Price",
                  style: TextStyle(fontSize: 15, height: 3),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 210),
              child: Text("Computer & Accessories",
                  style:
                      TextStyle(fontSize: 10, color: Colors.grey, height: 0.2)),
            ),
            Row(
              children: [
                Text(
                  "Tesseract pvt",
                  style: TextStyle(height: 3, fontSize: 15),
                ),
                SizedBox(width: 120),
                Text("QTY${model.productName}",
                    style: TextStyle(fontSize: 15, height: 3)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220, top: 25),
              child: Text("Descripation:",
                  style: TextStyle(height: 1, fontSize: 16)),
            ),
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s",
                style: TextStyle(
                  fontSize: 13,
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 22,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(120, 30)),
                  onPressed: () {},
                  child: Text("SAVE"),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(120, 30)),
                  onPressed: () {
                    getproduct();
                  },
                  child: Text("DELETE"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getproduct() async {
    try {
      var response = await Dio()
          .get("https://testecommerce.equitysofttechnologies.com/product/get");
      print(response.data);
      model = productModel.fromJson(response.data['r']);
      setState(() {});
      //productList = productModel.fromJson(response.data) as List<productModel>;
    } catch (e) {
      print(e);
    }
  }
}
