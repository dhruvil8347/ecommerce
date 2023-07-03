import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Company extends StatefulWidget {
  Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameCtrl = TextEditingController();

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
              decoration: InputDecoration(
                  label: Text("Company Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 45)),
              child: Text("ADD")),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 220),
            child: Text("List of companies"),
          ),
        ],
      ),
    );
  }

  void addcompany() async {
    try {
      Map<String, dynamic> body = {'mobile_no': nameCtrl.text};
      var response = await Dio().post(
          "testecommerce.equitysofttechnologies.com/company/add",
          data: body);
      print("dfdff--->${response.data}");
    } catch (e) {
      print(e);
    }
  }
}
