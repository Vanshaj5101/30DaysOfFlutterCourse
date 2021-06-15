import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';


class CatalougeHeader extends StatelessWidget {
  const CatalougeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalouge App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBluishColor,
          ),
        ),
        Text(
          "Trending products",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBluishColor,
          ),
        ),
      ],
    );
  }
}