import 'package:flutter/material.dart';

import 'common/textfiled.dart';

class Addproduct extends StatelessWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextfiled(
                label: 'Productname',
                obscureText: false,),
              SizedBox(height: 15,),
              AppTextfiled(
                  obscureText: false,
                  label: 'Category'
              ),
              SizedBox(height: 15,),
             AppTextfiled(obscureText: false,
                 label: 'Comapany Name'),
             /*Container(
            width: 150,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 1.2),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Month",style: TextStyle(fontSize: 10)),
                  ),
                  value: dropdownvalue.isEmpty ? null : dropdownvalue,
                  items: item.map((String item) {
                    return DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item,style: TextStyle(fontSize: 10)),
                        ),
                        value: item);
                  }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdownvalue = newvalue!;
                    });
                  }),
            ),
          ),*/
              SizedBox(height: 15,),
              AppTextfiled(
                 maxLines: 10,
                  minLines: 120,
                  obscureText: false,
                  label: 'Description'
              ),
              SizedBox(height: 15,),
              AppTextfiled(
                  obscureText: false,
                  label: 'Price'),
              SizedBox(height: 15,),
              AppTextfiled(
                  obscureText: false,
                  label: 'Qty'),


              Padding(
                padding: const EdgeInsets.only(top: 15,right: 290),
                child: Text("Upload Image:"),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                 Container(
                   height: 50,
                   width: 80,
                   decoration: BoxDecoration(
                     borderRadius:BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                         offset: Offset(0.0, 0.0),
                         blurRadius: 1.2,
                         color: Colors.grey,
                         blurStyle: BlurStyle.outer
                       ),
                     ]

                   ),
                   child: Icon(Icons.add),
                 ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 1.2,
                              color: Colors.grey,
                              blurStyle: BlurStyle.outer
                          ),
                        ]

                    ),
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 1.2,
                              color: Colors.grey,
                              blurStyle: BlurStyle.outer
                          ),
                        ]

                    ),
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 1.2,
                              color: Colors.grey,
                              blurStyle: BlurStyle.outer
                          ),
                        ]

                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 40)
                  ),
                  onPressed: (){}, child: Text("SAVE")),

              


            ],
          ),
        ),
      ),
    );
  }
}
