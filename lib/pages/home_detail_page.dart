import 'package:flutter/material.dart';

import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomeDetailsPage extends StatelessWidget {
  final Products item;
  const HomeDetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Hero(
                  tag: item.id.toString(),
                  child: Image.network(item.imageUrl),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                //color: Colors.red,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            item.productName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.darkBluishColor,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            item.discription,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: MyTheme.darkBluishColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${item.price.toString()}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.red,
                fontSize: 28,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Buy",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
