class SubmitProductModel {
  final List<SelectedProduct> products;

  SubmitProductModel({this.products});

  Map<String, dynamic> toJson() {
    //TODO: Convert to json
    return {
      "products": products,
    };
  }
}

class SelectedProduct {
  final int id;
  final int quantity;
  final int price;

  SelectedProduct({this.id, this.quantity, this.price});
  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price": price,
      };
}
