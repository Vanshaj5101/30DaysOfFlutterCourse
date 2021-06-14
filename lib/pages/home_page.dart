import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalouge.dart';
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

class CatalougeList extends StatelessWidget {
  const CatalougeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalougeItem = CatalougeModel.products[index];
        return CatalougeItems(
          products: catalougeItem,
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
              ClipRRect(
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
