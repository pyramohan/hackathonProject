import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<ProductModel> products;
  const CartScreen({this.products});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> names = [
    "Price Details",
    "Address",
    "Payment",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cart Screen"),
              CircleAvatar(
                child: Image.asset("assets/images/user.png"),
              )
            ],
          ),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
