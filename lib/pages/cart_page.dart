import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/models/provider_class.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: CartList(),
            ),
          ),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ProvideClass>(context);

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${myProvider.cart.totalPrice}",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Theme.of(context).accentColor,
                ),
          ),
          ElevatedButton(
            clipBehavior: Clip.antiAlias,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).buttonColor,
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Buy option is not supported yet :("),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Buy",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ProvideClass>(context);
    return myProvider.cart.products.isEmpty
        ? Center(
            child: Text(
              "Cart is Empty :(",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
            ),
          )
        : ListView.builder(
            itemCount: myProvider.cart.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.done,
                  color: Theme.of(context).accentColor,
                ),
                trailing: IconButton(
                  onPressed: () {
                    myProvider.cart
                        .removeProduct(myProvider.cart.products[index]);
                  },
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                title: Text(
                  myProvider.cart.products[index].productName,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              );
            },
          );
  }
}
