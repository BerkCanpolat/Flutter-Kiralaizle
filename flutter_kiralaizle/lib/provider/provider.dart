import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/Service/FirebaseAuth.dart';
import 'package:flutter_kiralaizle/Service/FirebaseStore.dart';
import 'package:flutter_kiralaizle/Service/Firebase_storage.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/model/userModel.dart';

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



  UserModel? _userModel;
  UserModel get getuserInformationProvider => _userModel!;

  void getuserFirebase() async{
    _userModel = await StoreService.instance.getuserInformation();
    notifyListeners();
  }


  void updateUserProfile(BuildContext context, UserModel userModel, File? file) async{
    if(file == null){
      showLoaderDialog(context);
      _userModel = userModel;
      await FirebaseFirestore.instance
      .collection("Users")
      .doc(_userModel?.id)
      .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    }else{
      showLoaderDialog(context);
      String imageUrl = await StorageService.instance.uploadUserImage(file);
      _userModel = userModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
      .collection("Users")
      .doc(_userModel?.id)
      .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    }
    showMessage("Profil Güncellendi");
    notifyListeners();
  }
}