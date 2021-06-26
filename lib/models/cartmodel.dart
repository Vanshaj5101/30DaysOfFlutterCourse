import 'package:flutter_catalog/models/catalouge.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  CatalougeModel _catalougeModel = CatalougeModel();

  final List<int> itemIDs = [];

  CatalougeModel get catalougeModel => _catalougeModel;
  set catalougeModel(CatalougeModel newCatalouge) {
    _catalougeModel = newCatalouge;
  }

  // get items in cart
  List<Products> get products =>
      itemIDs.map((id) => _catalougeModel.getById(id)).toList();

  // get total price
  num get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

  // add item in cart
  void addProduct(Products product) {
    itemIDs.add(product.id);
  }

  // remove elemnt in cart
  void removeProduct(Products product) {
    itemIDs.remove(product.id);
  }
}
