import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){
Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

showLoaderDialog(BuildContext context){
  AlertDialog dialog = AlertDialog(
    backgroundColor: Colors.black,
    content: Builder(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.white),
          Text("Loading..",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ],
      );
    },),
  );
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context){
      return dialog;
    }
  );
}


bool loginValidate(String email, String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("E-mail Ve Şifre Boş");
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

bool signUpValidate(String email, String password,String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    showMessage("Lütfen Tüm Kutucukları Doldurun!");
    return false;
  }else if(name.isEmpty){
    showMessage("İsim Boş");
    return false;
  }else if(email.isEmpty){
    showMessage("E-mail Boş");
    return false;
  }else if(phone.isEmpty){
    showMessage("Telefon Boş");
    return false;
  }
  else if(password.isEmpty){
    showMessage("Şifre Boş");
    return false;
  }else{
    return true;
  }
}