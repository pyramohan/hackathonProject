import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_project/core/api_call.dart';
import 'package:hackathon_project/core/errors/exceptions.dart';
import 'package:hackathon_project/core/widgets/loading_spinkit_widget.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:hackathon_project/features/cart/presentation/productAdapter/product_adapter.dart';
import 'package:hackathon_project/features/products/presentation/providers/products_provider.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  List<ProductModel> products = [];

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
      appBar: AppBar(
        title: Text("Products Screen"),
      ),
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
              return Column(
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

      var eventLists = json.decode(response.body)['eventLists'] as List;
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
