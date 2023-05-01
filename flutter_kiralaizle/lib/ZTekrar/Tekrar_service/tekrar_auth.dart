import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';

class TekrarAuthService{
  static TekrarAuthService instance = TekrarAuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get tekrarAuthChanges => _auth.authStateChanges();

  Future<bool> tekrarGiris(String email, String password,BuildContext context) async{
    try {
      tekrarShowLoading(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      tekrarMESAJ(e.toString());
      return false;
    }
  }

  Future<bool> tekrarKayit(String email, String password,BuildContext context) async{
    try {
      tekrarShowLoading(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      tekrarMESAJ(e.toString());
      return false;
    }
  }
}