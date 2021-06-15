import 'package:flutter/cupertino.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: MyTheme.darkBluishColor,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Hero(
                  tag: item.id.toString(),
                  child: Container(
                    height: height * 0.4,
                    width: width,
                    child: Image.network(item.imageUrl),
                  ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBluishColor,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          item.discription,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: MyTheme.darkBluishColor,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "dataDiam sed ipsum sit amet elitr. Vero tempor amet sed diam eos sed no lorem amet. Ea kasd elitr consetetur eirmod dolor eirmod et labore. Ipsum et sed ipsum no.",
                            style: TextStyle(
                              color: MyTheme.darkBluishColor,
                            ),
                          ),
                        )
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
