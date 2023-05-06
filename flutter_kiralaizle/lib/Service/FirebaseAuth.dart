import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/model/userModel.dart';

class AuthService{
  static AuthService instance = AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> loginService(String email, String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.toString());
      return false;
    }
  }


  Future<bool> signUpService(String name,String email, String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(id: userCredential.user!.uid, name: name, email: email);
      _firestore.collection("Users").doc(userModel.id).set(userModel.toJson());
      Navigator.pop(context);
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.toString());
      return false;
    }
  }
}