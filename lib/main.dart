import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/cart/presentation/pages/cart_screen.dart';
import 'features/cart/presentation/providers/cart_provider.dart';
import 'features/products/presentation/pages/products_screen.dart';
import 'features/products/presentation/providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _initialRoute = '/productsScreen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: _initialRoute,
        routes: {
          '/productsScreen': (context) => ProductsScreen(),
          '/cartScreen': (context) => CartScreen(),
          // '/loginScreen': (context) => LoginScreen(),
        },
        title: 'Hackathon Project',
      ),
    );
  }
}
