import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/models/user_model/user_model.dart';

class TekrarStore {
  static TekrarStore instance = TekrarStore();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> tekrarCategory() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection("categories").get();
      List<CategoryModel> _tekrarList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return _tekrarList;
    } on FirebaseException catch (e) {
      showMessage(e.code);
      return [];
    }
  }

  Future<List<ProductModel>> tekrarProduct() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collectionGroup("products").get();
      List<ProductModel> _tekrarProduct = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return _tekrarProduct;
    } on FirebaseException catch (e) {
      showMessage(e.code);
      return [];
    }
  }

  Future<List<ProductModel>> tekrarCategoryView(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection("categories")
          .doc(id)
          .collection("products")
          .get();
      List<ProductModel> _tekrarView = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return _tekrarView;
    } on FirebaseException catch (e) {
      showMessage(e.code);
      return [];
    }
  }

  Future<UserModel> tekrargetUserInformation() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _firestore
        .collection("tekrarTwoUser")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    return UserModel.fromJson(documentSnapshot.data()!);
  }
}
