import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_project/core/errors/exceptions.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:hackathon_project/features/cart/presentation/productAdapter/product_adapter.dart';
import 'package:hackathon_project/features/cart/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  List<ProductModel> products = [];

  CartScreen();

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => Container(
                color: Colors.black,
                height: 2,
              ),
              itemCount: widget.products.length,
              itemBuilder: (BuildContext context, int i) {
                ProductModel singleProduct = widget.products[i];
                return ProductAdapter(singleProduct: singleProduct);
              },
            ),
          ),
        ],
      ),
    );
  }
}
