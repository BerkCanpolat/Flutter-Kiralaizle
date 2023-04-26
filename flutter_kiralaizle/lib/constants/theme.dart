import 'package:flutter/material.dart';

ThemeData projeTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black)
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: mainBorder,
    errorBorder: mainBorder,
    disabledBorder: mainBorder,
    focusedBorder: mainBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      side: BorderSide(
        color: Colors.red,
        width: 3
      ),
      textStyle: TextStyle(color: Colors.red),
    )
  )
);


OutlineInputBorder mainBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);