import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16,
  );
}


bool loginValidation(String email, String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("Email Ve Şifre Boş");
    return false;
  }else if(email.isEmpty){
    showMessage("E-mail Boş");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre Boş");
    return false;
  }else{
    return true;
  }
}

bool signUpValidation(String email, String password, String phone, String name){
  if(email.isEmpty && password.isEmpty && phone.isEmpty && name.isEmpty){
    showMessage("Boş Olan Kutucuklar Var");
    return false;
  }else if(email.isEmpty){
    showMessage("E-mail Boş");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre boş");
    return false;
  }else if(phone.isEmpty){
    showMessage("Telefon Boş");
    return false;
  }else if(name.isEmpty){
    showMessage("İsim Boş");
    return false;
  }else{
    return true;
  }
}

showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
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
    },),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
}