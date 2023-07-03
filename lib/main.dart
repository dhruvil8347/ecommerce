import 'package:ecommerce/category.dart';
import 'package:ecommerce/common/textfiled.dart';
import 'package:ecommerce/company.dart';
import 'package:ecommerce/productlisting.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "star",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product(),));
              },
              child: Container(
                height: 200,
                width: 400,
                color: Colors.orange[200],
                child: Center(child: Text("Products",style: TextStyle(color: Colors.white,fontSize: 22),)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Category(),));
              },
              child: Container(
                height: 200,
                width: 400,
                color:  Colors.orange[200],
                child: Center(child: Text("Manage Category",style: TextStyle(color: Colors.white,fontSize: 22),)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Company(),));
              },
              child: Container(
                height: 200,
                width: 400,
                color: Colors.orange[200],
                child: Center(child: Text("Manage Company",style: TextStyle(color: Colors.white,fontSize: 22),)),
              ),
            ),

          ),


        ],
      )



    );
  }
}

