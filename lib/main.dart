import 'package:flutter/material.dart';
import 'package:hackathon_project/features/payment/presentation/pages/payment_screen.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_colors.dart';
import 'features/address/presentation/providers/address_provider.dart';
import 'features/cart/presentation/pages/cart_screen.dart';
import 'features/cart/presentation/providers/cart_provider.dart';
import 'features/products/presentation/pages/products_screen.dart';
import 'features/products/presentation/providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _initialRoute = '/cartScreen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
            create: (_) => ProductsProvider()),
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // fontFamily: "Avenir",
          primaryColor: AppColors.colorPrimary,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: _initialRoute,
        routes: {
          '/productsScreen': (context) => ProductsScreen(),
          '/cartScreen': (context) => CartScreen(),
          '/payment': (context) => PaymentScreen(),
        },
        title: 'Hackathon Project',
      ),
    );
  }
}
