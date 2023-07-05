class CategoryModel {
  int s;
  String m;
  List<Category> category;


  CategoryModel ({
    this.s = 0,
    this.m = "",
    this.category = const []
  });

  factory CategoryModel.fromjson(Map<String,dynamic>json){
    return CategoryModel(
      s: json['s'] ?? 0,
      m: json['m'] ?? "",
      category: List<Category>.from((json['r']??[]).map((e)=>Category.fromjson(e)))
    );
  }

  Map<String, dynamic> toJson() => {
    "s": s,
    "m": m,
    "r": category,
  };
}

class Category {
  int id;
  String categoryName;

  Category({
    this.id = 0,
    this.categoryName = "",
  });

  factory Category.fromjson(Map<String,dynamic>json){
    return Category(
      id: json['id'] ?? 0,
      categoryName: json['category_name'] ?? "",
    );
  }
}