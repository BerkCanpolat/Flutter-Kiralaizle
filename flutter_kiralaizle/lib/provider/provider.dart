import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';

class AppProvider with ChangeNotifier{

  List<ProductModel> _productProvider = [];

  List<ProductModel> get getProductProvider => _productProvider;

  void addCart(ProductModel productModel){
    _productProvider.add(productModel);
    notifyListeners();
  }


  void removeCart(ProductModel productModel){
    _productProvider.remove(productModel);
    notifyListeners();
  }



  ////// Favori Listeme EKlemek Ve Kaldırmak İçin ////////
  
  List<ProductModel> _productFavouriteProvider = [];

  List<ProductModel> get getFavouriteProduct => _productFavouriteProvider;
  

  void addFavouriteCart(ProductModel productModel){
    _productFavouriteProvider.add(productModel);
    notifyListeners();
  }


  void removeFavouriteCart(ProductModel productModel){
    _productFavouriteProvider.remove(productModel);
    notifyListeners();
  }


}