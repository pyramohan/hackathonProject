import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/features/address/presentation/pages/address_screen.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:hackathon_project/features/payment/presentation/pages/payment_screen.dart';
import 'package:hackathon_project/features/products/presentation/pages/products_screen.dart';

class CartScreen extends StatefulWidget {
  List<ProductModel> products = [];

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
        body: Expanded(
          child: PageView(
            dragStartBehavior: DragStartBehavior.start,
            controller: PageController(
              initialPage: 1,
              keepPage: true,
            ),
            children: [
              ProductsScreen(),
              AddressScreen(),
            ],
            onPageChanged: (int index) {
              setState(() {

              });
            },
          ),
        ),
      ),
    );
  }
}
