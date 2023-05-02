import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-images.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-routes.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Auth/Tekrar_Login/tekrar-login.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-primarybutton.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-widgets.dart';

class TekrarWelcome extends StatelessWidget {
  const TekrarWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TekrarTopTitle(title: "Hoşgeldin!", subtitle: "İstediğin yerde kirala ve izle"),
          Image.asset(TekrarImages.instance.welcomeMain),
          Row(
            children: [
              Icon(Icons.facebook),
              Image.asset(TekrarImages.instance.googleMain,scale: 40,),
            ],
          ),
          TekrarPrimaryButton(title: "Login",onPressed: (){
            TekrarRoutes.instance.tekrarPush(widget: TekrarLogin(), context: context);
          },),
          TekrarPrimaryButton(title: "SignUp",onPressed: (){},),
        ],
      ),
    );
  }
}