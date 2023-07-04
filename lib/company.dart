import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/addcompany.dart';


class Company extends StatefulWidget {
  Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  void initState() {
    super.initState();
   // addcompany();
    getcompany();


  }



  TextEditingController nameCtrl = TextEditingController();
  List<String> nameList = [];
  add addCompany = add();
  List<add> comapanyList = [];
 // List<Re> comapany = [];
 // R view = R.fromJson({});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Company")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: nameCtrl,

              decoration: InputDecoration(
                  label: Text("Company Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addcompany();
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 45)),
              child: Text("ADD")),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 220),
            child: Text("List of companies"),
          ),


          Expanded(
            child: ListView.builder(
              itemCount: comapanyList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("name: ${comapanyList[index].r.companyName}"),
                  trailing: Row(
                    children: [
                      Icon(Icons.delete),
                    ],
                  ),

                );
            },),
          )
        ],
      ),
    );
  }

  void addcompany() async {
    try {
      Map<String, dynamic> body = {'company_name': nameCtrl.text};

      var response = await Dio().post(
          "http://testecommerce.equitysofttechnologies.com/company/add",
         data: body);
      addCompany = add.fromJson(response.data);
      setState(() {
      });
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
      comapanyList =
      List<add>.from(response.data.map((e) => add.fromJson(e)));
    }
    catch(e)
    {
      print(e);
    }
  }



}
