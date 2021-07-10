import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _initialRoute = '/homeScreen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => HistoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: _initialRoute,
        routes: {
          '/cartScreen': (context) => CartScreen(),
          '/loginScreen': (context) => LoginScreen(),
        },
        title: 'Hackathon Project',
      ),
    );
  }
}
