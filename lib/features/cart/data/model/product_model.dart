class ProductModel {
  int id;
  String name;
  String image;
  num price;
  String size;
  int Quantity;

  ProductModel({this.id, this.name, this.price, this.image, this.size, this.Quantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return new ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      size: json["size"],
      Quantity: 1,
    );
  }
}
