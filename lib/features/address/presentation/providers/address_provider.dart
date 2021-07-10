import 'package:flutter/material.dart';
import 'package:hackathon_project/features/address/data/models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  bool isloading = false;
  List<AddressModel> products = [];

  setProducts(List<AddressModel> products) {
    this.products = products;
    notifyListeners();
  }

  setLoading(bool value) {
    this.isloading = value;
    notifyListeners();
  }
}
