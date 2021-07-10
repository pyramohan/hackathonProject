import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  bool isloading = false;
  List<ProductModel> products = [];

  addQuantity(int id)
  {
    for(int i=0;i<products.length;i++)
      {
        if(products[i].id==id)
          {
            products[i].Quantity+=1;
          }
      }
    notifyListeners();
  }

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
