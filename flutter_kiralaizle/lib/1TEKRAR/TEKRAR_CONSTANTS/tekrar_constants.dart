import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void tekrarShowMessage(String message){
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black,
    fontSize: 18
  );
}


tekrarShowLoaderDialog(BuildContext context){
  AlertDialog tekrarAlert = AlertDialog(
    content: Builder(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Container(
            child: Text("Loading.."),
          ),
        ],
      );
    },
    ),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return tekrarAlert;
    },
  );
}


tekrarGirisValidate(String email, String password){
  if(email.isEmpty && password.isEmpty){
    tekrarShowMessage("İkiside Boş");
    return false;
  }else if(email.isEmpty){
    tekrarShowMessage("Email boş");
    return false;
  }else if(password.isEmpty){
    tekrarShowMessage("Şifre Boş");
    return false;
  }else{
    return true;
  }
}

tekrarKayitValidate(String email, String password,String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    tekrarShowMessage("Hepsi Boş");
    return false;
  }else if(email.isEmpty){
    tekrarShowMessage("Email boş");
    return false;
  }else if(name.isEmpty){
    tekrarShowMessage("İsim Boş");
    return false;
  }else if(phone.isEmpty){
    tekrarShowMessage("Telefon Boş");
    return false;
  }else if(password.isEmpty){
    tekrarShowMessage("Şifre Boş");
    return false;
  }else{
    return true;
  }
}