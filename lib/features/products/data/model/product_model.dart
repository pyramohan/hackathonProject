class ProductModel {
  final int id;
  final String name;
  final String image;
  final num price;
  final String size;

  ProductModel({this.id, this.name, this.price, this.image, this.size});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return new ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      size: json["size"],
    );
  }
}
