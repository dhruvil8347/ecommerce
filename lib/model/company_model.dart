class CompanyModel {
  int s;
  String m;
  List<Company> company;

  CompanyModel({
    this.s = 0,
    this.m = "",
    this.company = const [],
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    try {
      for (var element in json.keys) {
        print('$element ${json[element].runtimeType}');
      }
      return CompanyModel(
          s: int.tryParse('${json['s']}') ?? 0,
          m: json['m'] ?? "",
          company: List<Company>.from(
              (json['r'] ?? []).map((x) => Company.fromJson(x))));
    } catch (e) {
      print('$e');
      return CompanyModel();
    }
  }

  Map<String, dynamic> toJson() => {
        "s": s,
        "m": m,
        "r": company,
      };
}

class Company {
  final int id;
  final String companyName;

  const Company({
    this.id = 0,
    this.companyName = "",
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    try {
      json.keys.forEach((element) {
        print('$element ${json[element].runtimeType}');
      });

      return Company(
        id: int.tryParse('${json['id']}') ?? 0,
        companyName: json['company_name'] ?? "".toString(),
      );
    } catch (e) {
      print('$e');
      return Company();
    }
  }

// Map<String,dynamic>tojson(){
//   final Map<String,dynamic> data = new Map<String , dynamic>();
//   data['id'] = id;
//
//
// }
}
