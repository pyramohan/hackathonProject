import 'package:flutter/material.dart';
import 'package:hackathon_project/core/constants/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> _payments = [
    "Net Banking",
    "Online Banking",
    "Direct Transfer",
  ];
  List<String> _images = [
    "images/bank@2x.png",
    "images/Online@2x.png",
    "images/UPI@2x.png",
  ];
  String _payment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: List.generate(_payments.length, (index) {
                return RadioListTile(
                  value: _payments[index],
                  groupValue: _payment,
                  onChanged: (payment) {
                    setState(() {
                      _payment = payment;
                    });
                  },
                  title: Text(_payments[index]),
                  // secondary: ,
                );
              }),
            ),
          ),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 40,
            color: AppColors.colorPrimary,
            onPressed: () {},
            child: Text(
              "Pay now",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
