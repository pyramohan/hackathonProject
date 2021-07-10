class ProductModel {
  final int id;
  final String name;
  final String image;
  final num price;

  ProductModel({this.id, this.name, this.image, this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return new ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
    );
  }
}
