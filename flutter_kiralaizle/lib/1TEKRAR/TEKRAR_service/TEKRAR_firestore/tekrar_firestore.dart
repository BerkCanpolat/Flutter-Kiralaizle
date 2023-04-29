import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_constants.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarStore{
  static TekrarStore instance = TekrarStore();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> tekrarCategory() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").get();
      List<CategoryModel> tekrarList = querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      return tekrarList;
    } catch (e) {
      tekrarShowMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> tekrarProduct() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collectionGroup("products").get();
      List<ProductModel> tekrarProductList = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return tekrarProductList; 
    } catch (e) {
      tekrarShowMessage(e.toString());
      return [];
    }
  }


  Future<List<ProductModel>> tekrarCategoriesView(String id) async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").doc(id).collection("products").get();
      List<ProductModel> tekrarCatView = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return tekrarCatView;
    } catch (e) {
      tekrarShowMessage(e.toString());
      return [];
    }
}

}