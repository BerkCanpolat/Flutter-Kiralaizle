import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/user_model/user_model.dart';

class TekrarAuth{
  static TekrarAuth instance = TekrarAuth();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get tekrarGetAuthChange => _auth.authStateChanges();

  Future<bool> tekrarLogin(String email,String password, BuildContext context) async{
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code);
      return false;
    }
  }


  Future<bool> tekrarSignUp(String name,String email,String password, BuildContext context) async{
    try {
      showLoaderDialog(context);
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(id: credential.user!.uid, name: name, email: email, image: null);
      _firestore.collection("tekrarTwoUser").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code);
      return false;
    }
  }

  void tekrarCikis() async{
    await _auth.signOut();
  }
}