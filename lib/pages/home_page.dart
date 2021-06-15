import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalouge_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalouge_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //await Future.delayed(Duration(seconds: 2));
    var catalougeJson =
        await rootBundle.loadString("assets/files/catalouge.json");
    var decodedData = jsonDecode(catalougeJson);
    var productsData = decodedData["products"];
    CatalougeModel.products = List.from(productsData)
        .map<Products>((products) => Products.fromJson(products))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalougeHeader(),
                SizedBox(
                  height: 20,
                ),
                if (CatalougeModel.products.isNotEmpty)
                  Expanded(
                    child: CatalougeList(),
                  )
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
