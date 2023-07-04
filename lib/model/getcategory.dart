class Category {
  int s;
  String m;
  List<R> r;


  Category ({
    this.s = 0,
    this.m = "",
    this.r = const []
  });

  factory Category.fromjson(Map<String,dynamic>json){
    return Category(
      s: json['s'] ?? 0,
      m: json['m'] ?? "",
      r: List<R>.from((json['r']??[]).map((e)=>R.fromjson(e))),

    );
  }


}

class R {
  int id;
  String companyName;

  R({
    this.id = 0,
    this.companyName = "",
  });

  factory R.fromjson(Map<String,dynamic>json){
    return R(
      id: json['id'] ?? 0,
      companyName: json['company_name'] ?? "",
    );
  }
}