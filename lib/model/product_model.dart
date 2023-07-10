class product {
  int s;
  String m;
  List<productModel> record;

  product({this.s = 0, this.m = "", this.record = const []});

  factory product.fromjson(Map<String, dynamic> json) {
    return product(
        m: json['m'] ?? "",
        s: json['s'] ?? 0,
        record: List<productModel>.from(
            (json['r'] ?? []).map((e) => productModel.fromJson(e))));
  }
}

class productModel {
  int id;
  String productName;
  int categoryId;
  String categoryName;
  int companyId;
  String companyName;
  String description;
  double price;
  int qty;
  String createdAt;
  int status;
  List<ProductImg> productImg;

  productModel({
    this.id = 0,
    this.productName = "",
    this.categoryId = 0,
    this.categoryName = "",
    this.companyId = 0,
    this.companyName = "",
    this.description = "",
    this.price = 0.0,
    this.qty = 0,
    this.createdAt = "",
    this.status = 0,
    this.productImg = const [],
  });

  factory productModel.fromJson(Map<String, dynamic> json) {
    return productModel(
        id: json['id'] ?? 0,
        productName: json['product_name'] ?? "",
        categoryId: json['category_id'] ?? 0,
        categoryName: json['category_name'] ?? "",
        companyId: json['company_id'] ?? 0,
        companyName: json['company_name'] ?? "",
        description: json['description'] ?? "",
        price: json['price'].toDouble() ?? 0.0,
        qty: json['qty'] ?? 0,
        createdAt: json['created_at'] ?? "",
        status: json['status'] ?? 0,
        //productImg:  List<ProductImg>.from((json['r']??[]).map((e)=>ProductImg.fromJson(e)))
        productImg: List<ProductImg>.from(
            (json['product_img'] ?? []).map((e) => ProductImg.fromJson(e))));
  }
}

class ProductImg {
  int id;
  int productId;
  String productImg;
  String createdAt;

  ProductImg({
    this.id = 0,
    this.productId = 0,
    this.productImg = "",
    this.createdAt = "",
  });

  factory ProductImg.fromJson(Map<String, dynamic> json) {
    return ProductImg(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      productImg: json['product_img'] ?? "",
      createdAt: json['created_at'] ?? "",
    );
  }
}
