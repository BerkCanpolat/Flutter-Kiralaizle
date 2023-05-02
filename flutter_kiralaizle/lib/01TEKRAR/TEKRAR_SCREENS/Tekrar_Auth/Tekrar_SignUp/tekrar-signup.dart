import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-routes.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Auth/Tekrar_Home/tekrar-home.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-primarybutton.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-widgets.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-auth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';

class TekrarSignUp extends StatefulWidget {
  const TekrarSignUp({super.key});

  @override
  State<TekrarSignUp> createState() => _TekrarLoginState();
}

class _TekrarLoginState extends State<TekrarSignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TekrarTopTitle(title: "SignUp", subtitle: "Kayıt Ol"),
          TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(hintText: "E-mail"),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(hintText: "Password"),
          ),
          TextFormField(
            controller: phone,
            decoration: InputDecoration(hintText: "Phone"),
          ),
          TekrarPrimaryButton(
            title: "Create an account",
            onPressed: () async {
              bool isValidate = loginValidation(email.text, password.text);
              if (isValidate) {
                bool isLogined = await TekrarAuth.instance
                    .tekrarSignUp(name.text,email.text, password.text, context);
                if (isLogined) {
                  TekrarRoutes.instance.tekrarPushAndRemovedBack(
                      widget: TekrarHome(), context: context);
                }
              }
            },
          ),
          CupertinoButton(onPressed: () async {}, child: Text("Login"))
        ],
      ),
    );
  }
}
