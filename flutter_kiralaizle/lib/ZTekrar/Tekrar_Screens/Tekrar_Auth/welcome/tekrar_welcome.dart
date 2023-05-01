import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_Auth/tekrar_login.dart/tekrar_login.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_Auth/tekrar_signUp/tekrar_signUp.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_assets.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_routes.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_primaryButton.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_toptittles.dart';

class TekrarWelcome extends StatelessWidget {
  const TekrarWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TekrarTopTittles(title: "Merhaba", subtitle: "İstediğin yerde izle"),
          Image.asset(TekrarAssets.instance.girisEkrani),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook),
              Image.asset(TekrarAssets.instance.googleLogo,scale: 40,)
            ],
          ),
          TekrarPrimaryButton(title: "Giris",onPressed: (){
            TekrarRoutes.instance.tekrarPush(widget: TekrarLogin(), context: context);
          },),
          TekrarPrimaryButton(title: "Kayit Ol",onPressed: (){
            TekrarRoutes.instance.tekrarPush(widget: TekrarSignUp(), context: context);
          },),
        ],
      ),
    );
  }
}