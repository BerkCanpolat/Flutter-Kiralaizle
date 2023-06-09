import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/model/categoryModel.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/model/userModel.dart';

class StoreService{
  static StoreService instance = StoreService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> categoryModel() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").get();
      List<CategoryModel> categoriesList = querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      return categoriesList;
    }on FirebaseException catch (e) {
      showMessage(e.code);
      return [];
    }
  }


  Future<List<ProductModel>> productModel() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collectionGroup("products").get();
      List<ProductModel> productList = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return productList;
    }on FirebaseException catch (e) {
      showMessage(e.code);
      return [];
    }
  }


  Future<List<ProductModel>> categoriesView(String id) async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").doc(id).collection("products").get();
      List<ProductModel> productList = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return productList;
    }on FirebaseException catch (e) {
      showMessage(e.code);
      return [];
    }
  }


  Future<UserModel> getuserInformation() async{
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = 
    await _firestore
    .collection("Users")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get();

    return UserModel.fromJson(documentSnapshot.data()!);
  }
}