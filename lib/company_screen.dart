import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'model/company_model.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyState();
}

class _CompanyState extends State<CompanyScreen> {
  @override
  void initState() {
    super.initState();
    getcompany();
  }

  TextEditingController nameCtrl = TextEditingController();
  Company companyModel = Company();
  List<Company> comapanyList = [];
  bool isLoding = false;
  bool validate = false;

  // List<Re> comapany = [];
  // R view = R.fromJson({});
  //List<String> nameList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Company")),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  errorText: validate ? "Don't be chutiya pa" : null,
                  label: const Text("Company Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  nameCtrl.text.isEmpty ? validate = true : validate = false;
                });

                if (nameCtrl.text.isNotEmpty) {
                  addcompany();
                }
                nameCtrl.clear();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(330, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("ADD")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                companyModel.companyName = nameCtrl.text;
                if (companyModel.id > 0) {
                  /*  print(companyModel.id);
                  print(companyModel.companyName);*/
                  editcompany(companyModel);
                }
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("UPDATE")),
          const Padding(
            padding: EdgeInsets.only(top: 25, right: 220),
            child: Text("List of companies"),
          ),
          Expanded(
            child: isLoding
                ? Lottie.asset("assets/lottie/a.json")
                : ListView.builder(
                    itemCount: comapanyList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(comapanyList[index].companyName,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        companyModel = Company(
                                            id: comapanyList[index].id,
                                            companyName: comapanyList[index]
                                                .companyName);
                                        nameCtrl.text =
                                            comapanyList[index].companyName;
                                        companyModel.index = index;
                                      },
                                      child: const Icon(Icons.edit,
                                          color: Colors.white)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text("Delete",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                content: const Text(
                                                    'Are you sure you want to delete?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        deletecompany(
                                                            comapanyList[index]
                                                                .id);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        /*trailing: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                         Text("name: ${comapanyList[index].companyName}"),
                         Icon(Icons.delete),
                    ],
                  ),*/
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  void deletecompany(int id) async {
    Map<String, dynamic> body = {'id': id};

    var response = await Dio().post(
        "http://testecommerce.equitysofttechnologies.com/company/delete",
        data: body);
    print(response.data);
    setState(() {
      getcompany();
    });
  }

  void editcompany(Company company) async {
    try {
      Map<String, dynamic> body = {
        'id': company.id,
        'company_name': company.companyName
      };
      print(body);
      var response = await Dio().post(
        "http://testecommerce.equitysofttechnologies.com/company/update",
        data: body,
      );
      if (response.data['s'] == 1) {
        setState(() {
          comapanyList[company.index] = company;
        });
      } else {
        throw response.data['m'];
      }
    } catch (e) {
      print(e);
    }
  }

  void addcompany() async {
    try {
      isLoding = true;
      Map<String, dynamic> body = {'company_name': nameCtrl.text};
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/company/add",
          data: body);
      /* addCompany = CompanyModel.fromJson(response.data);*/
      setState(() {
        getcompany();
      });
      setState(() {
        isLoding = false;
      });
      print("dfdff--->${response.data}");
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void getcompany() async {
    try {
      isLoding = true;
      var response = await Dio()
          .get("http://testecommerce.equitysofttechnologies.com/company/get");
      print(response.data);
      comapanyList = CompanyModel.fromJson(response.data).company;
      setState(() {
        isLoding = false;
      });
    } catch (e) {
      print(e);
    }
  }
}
