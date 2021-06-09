import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/products_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyProductsList =
        List.generate(20, (index) => CatalougeModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyProductsList.length,
          itemBuilder: (context, index) {
            return ProductsWidget(
              products: dummyProductsList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
