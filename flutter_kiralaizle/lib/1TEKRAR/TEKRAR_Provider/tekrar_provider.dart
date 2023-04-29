import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarProvider with ChangeNotifier{
  List<ProductModel> _tekrarProviderList = [];

  void tekrarAddCard(ProductModel productModel){
    _tekrarProviderList.add(productModel);
    notifyListeners();
  }

  void tekrarRemoveCard(ProductModel productModel){
    _tekrarProviderList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get tekrarGetCardProductList => _tekrarProviderList;
}