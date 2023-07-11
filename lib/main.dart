import 'package:ecommerce/category_screen.dart';
import 'package:ecommerce/company_screen.dart';
import 'package:ecommerce/productlisting_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

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
        title: const Center(child: Text("Home")),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Product(),));
              },
              child: Container(
                height: 200,
                width: 400,
                color: Colors.orange[200],
                child: const Center(child: Text("Products",style: TextStyle(color: Colors.white,fontSize: 22),)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
              },
              child: Container(
                height: 200,
                width: 400,
                color:  Colors.orange[200],
                child: const Center(child: Text("Manage Category",style: TextStyle(color: Colors.white,fontSize: 22),)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const CompanyScreen(),));
              },
              child: Container(
                height: 200,
                width: 400,
                color: Colors.orange[200],
                child: const Center(child: Text("Manage Company",style: TextStyle(color: Colors.white,fontSize: 22),)),
              ),
            ),

          ),


        ],
      )



    );
  }
}

