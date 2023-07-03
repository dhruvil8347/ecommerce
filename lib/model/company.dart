class add {
  int s;
  String m;
  AddCompany addcompany;


  add({
   this.s = 0,
   this.m = "",
   this.addcompany = const AddCompany(),
});
  factory add.fromJson(Map<String,dynamic>json){
    return add(
      s: json['s'] ?? 0,
      m: json['m'] ?? "",
      addcompany: AddCompany.fromJson(json["r"] ?? {}),

    );
  }

}

class AddCompany
{
 final int id;
  final String companyName;

 const  AddCompany({
    this.id = 0,
    this.companyName = "",
});

  factory AddCompany.fromJson(Map<String , dynamic>json){
    return AddCompany(
      id: json['id'] ?? 0,
      companyName: json['company_name'] ?? "",
    );
  }
}