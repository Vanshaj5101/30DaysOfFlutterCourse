import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/models/catalouge.dart';
import 'package:provider/provider.dart';

class ProvideClass with ChangeNotifier {
  final cart = CartModel();
  final catalougeModel = CatalougeModel();
  Icon icon = Icon(CupertinoIcons.cart_badge_plus);
  late Products providerProduct;

  Icon changeIcon(Products products) {
    providerProduct = products;
    bool isInCart = cart.products.contains(providerProduct.id);
    if (!isInCart) {
      icon = Icon(Icons.done);
    } else {
      icon = Icon(CupertinoIcons.cart_badge_plus);
    }
    notifyListeners();
    return icon;
  }
}

class RemoveButton extends ProvideClass {
  void removeCartProduct(Products products) {
    cart.itemIDs.remove(products.id);

    notifyListeners();
  }
}

class AddButton extends ProvideClass {
  void addCartProduct(Products products) {
    cart.itemIDs.add(products.id);
    notifyListeners();
  }
}
