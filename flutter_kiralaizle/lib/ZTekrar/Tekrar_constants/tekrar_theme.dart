import 'package:flutter/material.dart';

ThemeData tekrarTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: tekrarOutline,
    enabledBorder: tekrarOutline,
    focusedBorder: tekrarOutline,
    disabledBorder: tekrarOutline,
    focusedErrorBorder: tekrarOutline,
    border: tekrarOutline,
    suffixIconColor: Colors.black,
    prefixIconColor: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: Colors.white
  )
);


OutlineInputBorder tekrarOutline = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black),
);