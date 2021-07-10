
import 'dart:ui';
import 'package:flutter/material.dart';

class ProductTheme {
  ProductTheme._();

  static Color productBackgroundColor = Color(0xffBF404F);

  static Color selectedTabBarColor = Color(0xff333333);
  static Color unselectedTabBarColor = Color(0xffB1B1B1);

  static Color nameTextColor = Color(0xff333333);
  static Color sizeTextColor = Color(0xffBF404F);
  static Color priceTextColor = Color(0xff333333);

  static Color proceedButtonColor = Color(0xffBF404F);

  //Text
  static TextStyle nameTextStyle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
    fontSize: 25,
    letterSpacing: 1.0,
    color: nameTextColor,
  );

  static TextStyle sizeTextStyle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 1.0,
    color: sizeTextColor,
  );

  static TextStyle priceTextStyle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 1.0,
    color: priceTextColor,
  );

  static TextStyle totalPriceTextStyle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.normal,
    fontSize: 25,
    letterSpacing: 1.0,
    color: priceTextColor,
  );

  static TextStyle proceedButtonTextStyle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 1.0,
    color: Colors.white,
  );

  static var adapterDecoration = BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: productBackgroundColor,
    ),
  );

}