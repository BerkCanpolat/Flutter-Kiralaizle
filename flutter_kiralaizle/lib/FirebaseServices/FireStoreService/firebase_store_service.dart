import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/models/user_model/user_model.dart';

class StoreService {
  static StoreService instace = StoreService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<CategoryModel>> getCategori() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection("categories").get();
      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getProductModel() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collectionGroup("products").get();
      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return productList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryView(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection("categories")
          .doc(id)
          .collection("products")
          .get();
      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return productList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<UserModel> getUserInformation() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection("users").doc(_auth.currentUser!.uid).get();

    return UserModel.fromJson(querySnapshot.data()!);
  }
}
