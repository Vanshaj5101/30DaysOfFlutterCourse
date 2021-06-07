class Products {
  final String id;
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
}

final products = [
  Products(
      id: "123abc",
      productName: "Earphone",
      discription: "JBL earphone limited edition",
      price: 300,
      colorCode: "#33055a",
      imageUrl:
          "https://www.jbl.com/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwcd770a25/JBL_TUNE%20115TWS_Product%20Image_Hero_Black.jpg?sw=270&sh=330&sm=fit&sfrm=png")
];
