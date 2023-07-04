class add {
  int s;
  String m;
  R r;


  add({
   this.s = 0,
   this.m = "",
   this.r = const R(),
});
  factory add.fromJson(Map<String,dynamic>json){
    try {
      for (var element in json.keys) {
        print('$element ${json[element].runtimeType}');
      }
      return add(
        s: int.tryParse('${json['s']}') ?? 0,
        m: json['m'] ?? "",
        r: R.fromJson(json["r"] ?? {}),
      );
    }catch(e){
      print('$e');
      return add();
    }
  }
  Map<String, dynamic>toJson()=>
      {
         "s":s,
         "m":m,
         "r":r,

      };
}

class R
{
 final int id;
  final String companyName;

 const  R({
    this.id = 0,
    this.companyName = "",
});

  factory R.fromJson(Map<String , dynamic>json){
    try {
      json.keys.forEach((element) {
        print('$element ${json[element].runtimeType}');
      });

    return R(
      id: int.tryParse('${json['id']}') ?? 0,
      companyName: json['company_name'] ?? "".toString(),
    );
    }catch(e){
     print('$e');
    return R();

    }
  }

 // Map<String,dynamic>tojson(){
 //   final Map<String,dynamic> data = new Map<String , dynamic>();
 //   data['id'] = id;
 //
 //
 // }


}
