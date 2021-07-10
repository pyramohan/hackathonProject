import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:hackathon_project/features/cart/presentation/cart_theme.dart';
import 'package:hackathon_project/features/products/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductAdapter extends StatelessWidget {
  final ProductModel singleProduct;
  final int index;
  List<String> _images = [
    "assets/images/pizza.jpeg",
    "assets/images/pizza2.jpeg",
    "assets/images/pizza3.jpeg",
  ];
  ProductAdapter({@required this.singleProduct, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                border: Border.all(color: Colors.grey, width: .5),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.0,
                    offset: Offset(1.0, 1.0),
                  ),
                ]),
            child: Image.asset(
              _images[index],
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                singleProduct.name,
                style: CartTheme.nameTextStyle,
              ),
              Text(
                singleProduct.size,
                style: CartTheme.sizeTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rs : \u{20B9}' + singleProduct.price.toString(),
                style: CartTheme.priceTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('remove pressed');
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text('1')),
                  GestureDetector(
                    onTap: () {
                      print('Add pressed');
                      Provider.of<ProductsProvider>(context, listen: false)
                          .addQuantity(singleProduct.id);
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
