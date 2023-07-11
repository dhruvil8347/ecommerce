class CategoryModel {
  int s;
  String m;
  List<CategoryList> category;

  CategoryModel({this.s = 0, this.m = "", this.category = const []});

  factory CategoryModel.fromjson(Map<String, dynamic> json) {
    return CategoryModel(
        s: json['s'] ?? 0,
      m: json['m'] ?? "",
        category: List<CategoryList>.from(
            (json['r'] ?? []).map((e) => CategoryList.fromjson(e))));
  }

  Map<String, dynamic> toJson() => {
    "s": s,
    "m": m,
    "r": category,
  };
}

class CategoryList {
  int id;
  String categoryName;

  CategoryList({
    this.id = 0,
    this.categoryName = "",
  });

  int index = 0;

  factory CategoryList.fromjson(Map<String, dynamic> json) {
    return CategoryList(
      id: json['id'] ?? 0,
      categoryName: json['category_name'] ?? "",
    );
  }
}