import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/user_model/user_model.dart';

class AuthService {
  static AuthService instance = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(String email, String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code);
      return false;
    }
  }

  Future<bool> signUp(String name,String email, String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(id: userCredential.user!.uid, name: name, email: email, image: null);
      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());

      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code);
      return false;
    }
  }

  Future<bool> signout() async{ 
    try {
      await _auth.signOut();
      return true;
    }on FirebaseAuthException catch (e) {
      showMessage(e.code);
      return false;
    }
  }
}