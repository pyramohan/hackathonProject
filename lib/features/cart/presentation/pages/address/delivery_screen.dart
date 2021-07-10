import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
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
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(2, (index) {
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
                        Text("Pizza Hut"),
                        Text("Respective address"),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
