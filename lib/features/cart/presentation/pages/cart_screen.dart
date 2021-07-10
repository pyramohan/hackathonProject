import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:hackathon_project/features/cart/presentation/productAdapter/product_adapter.dart';

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
        body: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: widget.products.map((singleProduct) {
                  return ProductAdapter(singleProduct: singleProduct);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
