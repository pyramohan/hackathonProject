import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_project/core/api_call.dart';
import 'package:hackathon_project/core/errors/exceptions.dart';
import 'package:hackathon_project/features/address/data/models/address_model.dart';
import 'package:hackathon_project/features/address/presentation/providers/address_provider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );
  }
}
