class Products {
  final int id;
  final String productName;
  final String discription;
  final num price;
  final String colorCode;
  final String imageUrl;

  Products(
      {required this.id,
      required this.productName,
      required this.discription,
      required this.price,
      required this.colorCode,
      required this.imageUrl});

  factory Products.fromJson(Map<dynamic, dynamic> map) {
    return Products(
      id: map["id"],
      productName: map["name"],
      discription: map["desc"],
      price: map["price"],
      colorCode: map["color"],
      imageUrl: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": productName,
        "desc": discription,
        "price": price,
        "color": colorCode,
        "image": imageUrl,
      };
}

class CatalougeModel {
  static List<Products> products = [];

  Products getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);
  Products getByPosi(int posi) => products[posi];
}
