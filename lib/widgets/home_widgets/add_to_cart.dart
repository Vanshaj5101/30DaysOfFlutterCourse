import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:flutter_catalog/models/provider_class.dart';
import 'package:provider/provider.dart';

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
  Icon cartIcon = Icon(CupertinoIcons.cart_badge_plus);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ProvideClass>(context);

    bool isInCart = myProvider.cart.products.contains(widget.products);

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
        if (!isInCart) {
          isInCart = !isInCart;

          myProvider.addCartProduct(widget.products);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Theme.of(context).buttonColor,
              content: Text(
                "Already added to cart.",
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                    ),
              )));
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
