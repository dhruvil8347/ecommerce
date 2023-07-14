import 'package:carousel_slider/carousel_slider.dart';
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

  // @override
  // void initState() {
  //   getproduct();
  //   super.initState();
  // }
  List<productModel> productlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
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
              children: [
                Text(widget.productListModel.productName,
                    style: TextStyle(fontSize: 15, height: 3)),
                SizedBox(width: 100),
                Text(
                  "Price: ${widget.productListModel.price}",
                  style: TextStyle(fontSize: 15, height: 3),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 210),
              child: Text(widget.productListModel.categoryName.toString(),
                  style:
                      TextStyle(fontSize: 10, color: Colors.grey, height: 0.2)),
            ),
            Row(
              children: [
                Text(
                  widget.productListModel.companyName,
                  style: TextStyle(height: 3, fontSize: 15),
                ),
                const SizedBox(width: 120),
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
                style: TextStyle(
                  fontSize: 13,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 22,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(120, 30)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addproduct(
                            productListModel: productModel(),
                          ),
                        ));
                  },
                  child: const Text("Edit"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(120, 30)),
                  onPressed: () {
                    // getproduct();
                  },
                  child: const Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
