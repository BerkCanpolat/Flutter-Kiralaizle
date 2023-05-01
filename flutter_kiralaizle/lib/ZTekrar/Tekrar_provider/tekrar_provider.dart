import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarProvider with ChangeNotifier{

  List<ProductModel> _providerProductList = [];

  void tekrarCardAdd(ProductModel productModel){
    _providerProductList.add(productModel);
    notifyListeners();
  }

  void tekrarCardRemove(ProductModel productModel){
    _providerProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get tekrarGetCardProductList => _providerProductList;




  List<ProductModel> _providerFavouriteList = [];

  void tekrarFavouritedAdd(ProductModel productModel){
    _providerFavouriteList.add(productModel);
    notifyListeners();
  }

  void tekrarFavouriteRemove(ProductModel productModel){
    _providerFavouriteList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get tekrarGetFavouriteProductList => _providerFavouriteList;
}