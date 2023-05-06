import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: _border,
    enabledBorder: _border,
    focusedBorder: _border,
    disabledBorder: _border,
    focusedErrorBorder: _border,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: 
        BorderSide(
          color: Colors.black),
          )
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    // color: Colors.black,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black)
  ),
);

OutlineInputBorder _border = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black),
);