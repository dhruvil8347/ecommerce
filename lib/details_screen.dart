import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'addproduct_screen.dart';
import 'model/product_model.dart';

class GetProduct extends StatefulWidget {
  const GetProduct({Key? key, required this.productListModel})
      : super(key: key);

  final productModel productListModel;

  @override
  State<GetProduct> createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  String imageUrl =
      "https://testecommerce.equitysofttechnologies.com/uploads/product_img/";

  List<productModel> productlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: false,
              ),
              items: widget.productListModel.productImg.map((e) {
                return Builder(
                  builder: (context) {
                    return Image.network(imageUrl + e.productImgg);
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.productListModel.productName,
                    style: const TextStyle(fontSize: 15, height: 3)),
                Text(
                  "Price: ${widget.productListModel.price}",
                  style: const TextStyle(fontSize: 15, height: 3),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 210),
              child: Text(widget.productListModel.categoryName,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.productListModel.companyName,
                  style: const TextStyle(height: 3, fontSize: 15),
                ),
                Text("QTY ${widget.productListModel.qty}",
                    style: const TextStyle(fontSize: 15, height: 3)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 220, top: 25),
              child: Text("Descripation:",
                  style: TextStyle(height: 1, fontSize: 16)),
            ),
            Text(widget.productListModel.description,
                style: const TextStyle(
                  fontSize: 13,
                )),
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took "),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Addproduct(
                                productListModel: widget.productListModel),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 30)),
                    child: const Text("Edit")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(120, 35)),
                    onPressed: () {
                      deleteProduct(widget.productListModel.id);
                      Navigator.of(context).pop();
                    },
                    child: Text("Delete")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteProduct(int id) async {
    try {
      Map<String, dynamic> body = {'id': id};
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/product/delete",
          data: body);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  /// void getproduct() async {
  ///   try {
  ///     var response = await Dio()
  ///         .get("https://testecommerce.equitysofttechnologies.com/product/get");
  ///     print(response.data);
  ///   /*  model = productModel.fromJson(response.data['r']);*/
  ///   /* productlist = List<productModel>.from(response.data['r'].map((e) => productModel.fromJson(e) ));*/
  ///    img= List<ProductImg>.from(response.data['product_img'].map((e) => ProductImg.fromJson(e) ));
  ///     setState(() {
  ///
  ///     });
  ///     //productList = productModel.fromJson(response.data) as List<productModel>;
  ///   } catch (e) {
  ///     print(e);
  ///   }
  /// }
}
