import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalouge.dart';

class ProductsWidget extends StatelessWidget {
  final Products products;

  const ProductsWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.network(products.imageUrl),
        title: Text(products.productName),
        subtitle: Text(products.discription),
        trailing: Text(
          "\$${products.price}",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.5,
        ),
        onTap: () {},
      ),
    );
  }
}
