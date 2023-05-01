import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_Auth/tekrar_signUp/tekrar_signUp.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_home/tekrar_home.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_routes.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_service/tekrar_auth.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_primaryButton.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_toptittles.dart';

class TekrarLogin extends StatefulWidget {
  const TekrarLogin({super.key});

  @override
  State<TekrarLogin> createState() => _TekrarLoginState();
}

class _TekrarLoginState extends State<TekrarLogin> {

  bool isVisible = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TekrarTopTittles(title: "Giriş", subtitle: "Tekrar Hoşgeldiniz!"),
            TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail",
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              obscureText: isVisible,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
              ),
            ),
            TekrarPrimaryButton(title: "Giriş",onPressed: () async{
              bool isValidate = tekrarLoginValidate(email.text, password.text);
              if(isValidate){
                bool isLogined = await TekrarAuthService.instance.tekrarGiris(email.text, password.text, context);
                if(isLogined){
                  TekrarRoutes.instance.tekrarPushAndRemove(widget: TekrarHome(), context: context);
                }
              }
            },),
            Text("Henüz Hesabın Yok Mu?"),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                TekrarRoutes.instance.tekrarPush(widget: TekrarSignUp(), context: context);
              },
              child: Text("Hesap Oluştur",style: TextStyle(color: Theme.of(context).primaryColor),)),
          ],
        ),
      ),
    );
  }
}