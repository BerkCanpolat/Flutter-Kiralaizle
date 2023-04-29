import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class AppProvider with ChangeNotifier{

  List<ProductModel> _cartProductList = [];

  void addCartProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }


  void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCardProductList => _cartProductList;

}