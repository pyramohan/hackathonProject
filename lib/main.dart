import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/cart/presentation/pages/cart_screen.dart';
import 'features/cart/presentation/providers/cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _initialRoute = '/cartScreen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: _initialRoute,
        routes: {
          '/cartScreen': (context) => CartScreen(),
          // '/loginScreen': (context) => LoginScreen(),
        },
        title: 'Hackathon Project',
      ),
    );
  }
}
