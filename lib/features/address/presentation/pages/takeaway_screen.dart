import 'package:flutter/material.dart';

class TakeAway extends StatefulWidget {
  const TakeAway({Key key}) : super(key: key);

  @override
  _TakeAwayState createState() => _TakeAwayState();
}

class _TakeAwayState extends State<TakeAway> {
  TextEditingController _city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 85,
          padding: EdgeInsets.all(16),
          child: TextFormField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              suffixText: "City",
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nearby Branches"),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
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
        )
      ],
    );
  }
}
