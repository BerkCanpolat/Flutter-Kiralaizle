import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_constants.dart';

class TekrarService{
  static TekrarService instance = TekrarService();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get tekrarAuthChange => _auth.authStateChanges();

  Future<bool> tekrarGiris(String email, String password, BuildContext context) async{
    try {
      tekrarShowLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException  catch (e) {
      Navigator.of(context).pop();
      tekrarShowMessage(e.code);
      return false;
    }
  }

  Future<bool> tekrarKayit(String email, String password, BuildContext context) async{
    try {
      tekrarShowLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException  catch (e) {
      Navigator.of(context).pop();
      tekrarShowMessage(e.code);
      return false;
    }
  }
}