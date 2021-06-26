import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';

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
                    //color: Theme.of(context).canvasColor,
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
                        color: Theme.of(context).accentColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      products.discription,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).accentColor,
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
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        AddToCart(products: products),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  final Products products;
  const AddToCart({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).buttonColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      onPressed: () {
        isAdded = !isAdded;
        final _catalouge = CatalougeModel();
        final _cart = CartModel();
        _cart.catalougeModel = _catalouge;
        _cart.addProduct(widget.products);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : Text("Buy"),
    );
  }
}
