import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-store.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/models/user_model/user_model.dart';

class TekrarProvider with ChangeNotifier{
  static TekrarProvider instance = TekrarProvider();

  List<ProductModel> productProviderList = [];

  List<ProductModel> get getProductProvider => productProviderList;

  UserModel? _userModel;
  UserModel get providerUserModel => _userModel!;


  void tekrarCardAdd(ProductModel model) async{
    productProviderList.add(model);
    notifyListeners();
  }


  void tekrarCardRemove(ProductModel model) async{
    productProviderList.remove(model);
    notifyListeners();
  }


  List<ProductModel> productFavouriteList = [];
  List<ProductModel> get getFavourite => productFavouriteList;
  void tekrarFavouritedAdd(ProductModel model) async{
    productFavouriteList.add(model);
    notifyListeners();
  }


  void tekrarFavouriteRemove(ProductModel model) async{
    productFavouriteList.remove(model);
    notifyListeners();
  }


  void tekrarinfoFirebase() async{
    _userModel = await TekrarStore.instance.tekrargetUserInformation();
    notifyListeners();
  }
}