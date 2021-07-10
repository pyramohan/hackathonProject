import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_project/core/api_call.dart';
import 'package:hackathon_project/core/errors/exceptions.dart';
import 'package:hackathon_project/core/widgets/loading_spinkit_widget.dart';
import 'package:hackathon_project/features/address/presentation/pages/address_screen.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:hackathon_project/features/products/presentation/productAdapter/product_adapter.dart';
import 'package:hackathon_project/features/products/presentation/providers/products_provider.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../product_theme.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen();

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductsProvider>(
        builder: (context, notifier, _) {
          List products = notifier.products;
          print('212121 notifier.isloading ' + notifier.isloading.toString());
          if (notifier.isloading) {
            return Align(
              alignment: Alignment.center,
              child: LoadingSpinkitWidget(
                spinkitColor: Colors.indigo,
              ),
            );
          } else {
            if (products.isEmpty) {
              return Align(
                alignment: Alignment.center,
                child: Text(
                  'No History Found',
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    //Products
                    Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) => Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                              color: Colors.grey,
                              height: 1,
                            ),
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int i) {
                              ProductModel singleProduct = products[i];
                              return ProductAdapter(
                                  singleProduct: singleProduct);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            //Item Total
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Item Total'),
                                Text(
                                  'Rs : \u{20B9}' + '200',
                                  style: ProductTheme.priceTextStyle,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            //Tax and others
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tax and Others'),
                                Text(
                                  'Rs : \u{20B9}' + '200',
                                  style: ProductTheme.priceTextStyle,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //Total
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total'),
                                Text(
                                  'Rs : \u{20B9}' + '200',
                                  style: ProductTheme.totalPriceTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => AddressScreen()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            color: ProductTheme.proceedButtonColor,
                            child: RaisedButton(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                },
                                color: ProductTheme.productBackgroundColor,
                                textColor: Colors.white,
                                child: Text('Proceed')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }

  Future<void> getProducts(BuildContext buildContext) async {
    Provider.of<ProductsProvider>(context, listen: false).setLoading(true);

    Response response =
        await http.Client().get(Uri.parse(API.baseURL + API.productList));

    print("GetProductsResponseBody: " + response.body.toString());

    //Set Products Provider loading to False
    Provider.of<ProductsProvider>(context, listen: false).setLoading(false);

    if (response.statusCode == 200) {
      print("GetProductsResponseBodySuccess" + response.body);

      var eventLists = json.decode(response.body)['data'] as List;
      var mProductLists = List<ProductModel>.from(eventLists.map((e) {
        return ProductModel.fromJson(e);
      }));

      Provider.of<ProductsProvider>(context, listen: false)
          .setProducts(mProductLists);
      print('212121 mProductLists : ' + mProductLists.length.toString());
    } else if (response.statusCode == 404) {
      throw ServerException();
    } else if (response.statusCode == 201) {
      return response.body;
    }
  }
}
