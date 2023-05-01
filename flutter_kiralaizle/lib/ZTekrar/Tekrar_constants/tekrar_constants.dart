import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void tekrarMESAJ(String message){
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16,
  );
}


tekrarShowLoading(BuildContext context){
AlertDialog tekrarAlert = AlertDialog(
  content: Builder(builder: (context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        Text("Loading.."),
      ],
    );
  },),
);
showDialog(
  context: context, 
  barrierDismissible: true,
  builder: (BuildContext context){
    return tekrarAlert;
  }
  );
}


bool tekrarLoginValidate(String email, String password){
  if(email.isEmpty && password.isEmpty){
    tekrarMESAJ("İkiside Boş");
    return false;
  }else if(email.isEmpty){
    tekrarMESAJ("Email Boş");
    return false;
  }else if(password.isEmpty){
    tekrarMESAJ("Şifre Boş");
    return false;
  }else{
    return true;
  }
}


bool tekrarSignUpValidate(String email, String password, String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    tekrarMESAJ("Hepsi Boş");
    return false;
  }else if(name.isEmpty){
    tekrarMESAJ("İsim Boş");
    return false;
  }else if(phone.isEmpty){
    tekrarMESAJ("Telefon Boş");
    return false;
  }
  else if(email.isEmpty){
    tekrarMESAJ("Email Boş");
    return false;
  }else if(password.isEmpty){
    tekrarMESAJ("Şifre Boş");
    return false;
  }else{
    return true;
  }
}