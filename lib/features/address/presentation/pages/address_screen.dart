import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/features/address/presentation/pages/delivery_screen.dart';
import 'package:hackathon_project/features/address/presentation/pages/takeaway_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<String> _types = ["Delivery", "Takeway"];
  String _type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(_types.length, (index) {
            return RadioListTile(
                value: _types[index],
                groupValue: _type,
                onChanged: (type) {
                  setState(() {
                    _type = type;
                  });
                });
          }),
        ),
        (_type == "Delivery") ? Delivery() : TakeAway(),
      ],
    );
  }
}
