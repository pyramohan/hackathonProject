import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';

class ProductAdapter extends StatelessWidget
{
  final ProductModel singleProduct;
  ProductAdapter({@required this.singleProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }
}