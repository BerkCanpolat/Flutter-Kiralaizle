import 'package:flutter/material.dart';

class TekrarRoutes{
  static TekrarRoutes instance = TekrarRoutes();

  Future<dynamic> pushAndNotBack({required Widget widget,required BuildContext context}){
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => widget), (route) => false);
  }

  Future<dynamic> push({required Widget widget,required BuildContext context}){
    return Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => widget));
  }
}