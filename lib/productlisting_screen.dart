import 'package:dio/dio.dart';
import 'package:ecommerce/addproduct_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'details_screen.dart';
import 'model/product_model.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}


class _ProductState extends State<Product> {
  List<productModel> productlist = [];
  List<ProductImg> productimg = [];
  bool isLoding = false;
  productModel product = productModel();
  String imageUrl =
      "https://testecommerce.equitysofttechnologies.com/uploads/product_img/";

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Addproduct(productListModel: productModel()),
                      ));
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GetProduct(
                                      productListModel: productlist[index]),
                                ));
                          },
                          child: Container(
                            height: 130,
                            width: 330,
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
                                    child: Image.network(
                                      imageUrl +
                                          productlist[index]
                                              .productImg
                                              .first
                                              .productImgg,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10),
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
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Addproduct(
                                                    productListModel:
                                                        productlist[index],
                                                  ),
                                                ));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(80, 30)),
                                          child: Text("Edit")),
                                      ElevatedButton(
                                          onPressed: () {
                                            deleteProduct(
                                                productlist[index].id);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(80, 30)),
                                          child: Text("Delete")),
                                    ],
                                  )
                                ],
                              ),
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
      /*productimg = List<ProductImg>.from(response.data.map((e)=> ProductImg.fromJson(e)));*/

      setState(() {
        isLoding = false;
      });
    } catch (e) {
      print(e);
    }
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
      print(respose.data);
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
