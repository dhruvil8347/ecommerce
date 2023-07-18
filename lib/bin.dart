/*
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  CompanyModel companyModel = CompanyModel();
  List<Company> comapanyList = [];
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
                  label: const Text("Company Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addcompany();
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(330, 45)),
              child: const Text("ADD")),
          const Padding(
            padding: EdgeInsets.only(top: 25, right: 220),
            child: Text("List of companies"),
          ),


          Expanded(
            child: ListView.builder(
              itemCount: comapanyList.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: Container(
                    height: 50,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(comapanyList[index].companyName,
                              style: const TextStyle(color: Colors.white)),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {},
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
                                              style:
                                              TextStyle(color: Colors.red)),
                                          content: const Text(
                                              'Are you sure you want to delete?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text("cancel")),
                                            TextButton(
                                                onPressed: () {
                                                  deletecompany(
                                                      comapanyList[index]
                                                          .id
                                                          .toString());
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
                  */
/*trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("name: ${comapanyList[index].companyName}"),
                      Icon(Icons.delete),
                    ],
                  ),*/ /*

                );
              },),
          )
        ],
      ),
    );
  }

  void deletecompany(String id) async {
    Map<String, dynamic> body = {'id': id};

    var response = await Dio().post(
        "http://testecommerce.equitysofttechnologies.com/company/delete",
        data: body);
    print(response.data);
  }

  void editcompany(String id, String text) async {
    Map<String, dynamic> body = {'id': id, 'text': text};

    var response = await Dio().get(
        "http://testecommerce.equitysofttechnologies.com/company/update",
        data: body);
    print(response.data);
  }

  void addcompany() async {
    try {
      Map<String, dynamic> body = {'company_name': nameCtrl.text};
      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/company/add",
          data: body);
      */
/* addCompany = CompanyModel.fromJson(response.data);*/ /*

      setState(() {});
      print("dfdff--->${response.data}");
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void getcompany()async{
    try {
      var response = await Dio().get("http://testecommerce.equitysofttechnologies.com/company/get");
      print(response.data);
      companyModel=CompanyModel.fromJson(response.data);
      comapanyList=companyModel.company;
      setState(() {

      });
    }
    catch(e)
    {
      print(e);
    }
  }
}
*/
