import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarStoreService{
  static TekrarStoreService instance = TekrarStoreService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> tekrarCategory() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").get();
      List<CategoryModel> tekrarList = querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      return tekrarList;
    }on FirebaseException catch (e) {
      tekrarMESAJ(e.code);
      return [];
    }
  }

  Future<List<ProductModel>> tekrarProduct() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collectionGroup("products").get();
      List<ProductModel> tekrarListTwo = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return tekrarListTwo;
    }on FirebaseException catch (e) {
      tekrarMESAJ(e.code);
      return [];
    }
  }
  Future<List<ProductModel>> tekrarCategoryView(String id) async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").doc(id).collection("products").get();
      List<ProductModel> tekrarListTwo = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return tekrarListTwo;
    }on FirebaseException catch (e) {
      tekrarMESAJ(e.code);
      return [];
    }
  }
}