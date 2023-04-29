import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
    )
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: _outlineInputBorder,
    border: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    disabledBorder: _outlineInputBorder,
    focusedErrorBorder: _outlineInputBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
  )
);


OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey),
);