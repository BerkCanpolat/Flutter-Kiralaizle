import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/FirebaseServices/FireStoreService/firebase_store_service.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/models/user_model/user_model.dart';

class AppProvider with ChangeNotifier{

  List<ProductModel> _cartProductList = [];
  UserModel? _userModel;

  UserModel get getUserInformation => _userModel!;

  void addCartProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }


  void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCardProductList => _cartProductList;




  //// FAVOURİTE ////
  
  List<ProductModel> _cartFavouritetList = [];

  void addFavouriteProduct(ProductModel productModel){
    _cartFavouritetList.add(productModel);
    notifyListeners();
  }


  void removeFavouriteProduct(ProductModel productModel){
    _cartFavouritetList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavouritedProductList => _cartFavouritetList;



  /////// UserInformation ////////////
  

  void getUserInfoFirebase() async{
    _userModel = await StoreService.instace.getUserInformation();
    notifyListeners();
  }
  

}