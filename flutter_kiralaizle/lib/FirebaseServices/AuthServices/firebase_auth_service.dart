import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';

class AuthService {
  static AuthService instance = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<bool> signUp(String email, String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code);
      return false;
    }
  }

  void signout() async{ 
    await _auth.signOut();
  }
}