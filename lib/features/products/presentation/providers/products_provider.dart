import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  bool isloading = false;
  List<ProductModel> products = [];

  setProducts(List<ProductModel> products)
  {
    this.products = products;
    notifyListeners();
  }

  setLoading(bool value) {
    this.isloading = value;
    notifyListeners();
  }
}
