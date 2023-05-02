import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-routes.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Auth/Tekrar_Home/tekrar-home.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Auth/Tekrar_SignUp/tekrar-signup.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-primarybutton.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-widgets.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-auth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';

class TekrarLogin extends StatefulWidget {
  const TekrarLogin({super.key});

  @override
  State<TekrarLogin> createState() => _TekrarLoginState();
}

class _TekrarLoginState extends State<TekrarLogin> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TekrarTopTitle(title: "Login", subtitle: "Tekrar Hoş geldin"),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: "E-mail"
            ),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Password"
            ),
          ),
          TekrarPrimaryButton(title: "Login",onPressed: () async{
            bool isValidate = loginValidation(email.text, password.text);
            if(isValidate){
              bool isLogined = await TekrarAuth.instance.tekrarLogin(email.text, password.text, context);
              if(isLogined){
                TekrarRoutes.instance.tekrarPushAndRemovedBack(widget: TekrarHome(), context: context);
              }
            }
          },),
          CupertinoButton(
            onPressed: (){
              TekrarRoutes.instance.tekrarPush(widget: TekrarSignUp(), context: context);
            },
            child: Text("Create an account"))
        ],
      ),
    );
  }
}