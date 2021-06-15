import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';

import 'package:flutter_catalog/widgets/themes.dart';

class CatalougeList extends StatelessWidget {
  const CatalougeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalougeItem = CatalougeModel.products[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeDetailsPage(
                    item: catalougeItem,
                  );
                },
              ),
            );
          },
          child: CatalougeItems(
            products: catalougeItem,
          ),
        );
      },
      itemCount: CatalougeModel.products.length,
    );
  }
}

class CatalougeItems extends StatelessWidget {
  final Products products;

  const CatalougeItems({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: products.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.network(
                      products.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      products.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyTheme.darkBluishColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      products.discription,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: MyTheme.darkBluishColor,
                        fontSize: 10,
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${products.price.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: MyTheme.darkBluishColor,
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
                          child: Text("Buy"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
