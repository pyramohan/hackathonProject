import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_project/core/api_call.dart';
import 'package:hackathon_project/core/errors/exceptions.dart';
import 'package:hackathon_project/features/address/data/models/address_model.dart';
import 'package:hackathon_project/features/address/presentation/providers/address_provider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Delivery extends StatefulWidget {
  const Delivery({Key key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getaddresses(context);
  }

  TextEditingController _city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 85,
          padding: EdgeInsets.all(16),
          child: TextFormField(
            maxLines: 4,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              suffixText: "Address",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            controller: _city,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text("Existing address"),
        ),
        Consumer<AddressProvider>(
          builder: (context, snapshot, widget) {
            print(snapshot.products);
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(snapshot.products.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 150,
                      width: 150,
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.products[index].name),
                            Text("Respective address"),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        )
      ],
    );
  }

  Future<void> getaddresses(BuildContext buildContext) async {
    Provider.of<AddressProvider>(context, listen: false).setLoading(true);

    Response response =
        await http.Client().get(Uri.parse(API.baseURL + API.getAllAddress));

    print("GetProductsResponseBody: " + response.body.toString());

    //Set Products Provider loading to False
    Provider.of<AddressProvider>(context, listen: false).setLoading(false);

    if (response.statusCode == 200) {
      print("GetProductsResponseBodySuccess" + response.body);

      var eventLists = json.decode(response.body)['data'] as List;
      var mProductLists = List<AddressModel>.from(eventLists.map((e) {
        return AddressModel.fromJson(e);
      }));

      Provider.of<AddressProvider>(context, listen: false)
          .setProducts(mProductLists);
      print('212121 mProductLists : ' + mProductLists.length.toString());
    } else if (response.statusCode == 404) {
      throw ServerException();
    } else if (response.statusCode == 201) {
      return response.body;
    }
  }
}
