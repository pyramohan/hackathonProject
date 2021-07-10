import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<ProductModel> products;
  const CartScreen({this.products});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart Screen"),
        ),
      ),
    );
  }
}
