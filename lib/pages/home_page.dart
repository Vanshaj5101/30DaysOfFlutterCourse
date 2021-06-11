import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/products_widget.dart';

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
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalougeModel.products.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final product = CatalougeModel.products[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: GridTile(
                        header: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            product.productName.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Image.network(
                          product.imageUrl,
                        ),
                        footer: Text(product.price.toString()),
                      ),
                    );
                  },
                  itemCount: CatalougeModel.products.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
