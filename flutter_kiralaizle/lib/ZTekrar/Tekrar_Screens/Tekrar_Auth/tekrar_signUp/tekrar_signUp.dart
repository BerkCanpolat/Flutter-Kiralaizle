import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_home/tekrar_home.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_routes.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_service/tekrar_auth.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_primaryButton.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_toptittles.dart';

class TekrarSignUp extends StatefulWidget {
  const TekrarSignUp({super.key});

  @override
  State<TekrarSignUp> createState() => _TekrarSignUpState();
}

class _TekrarSignUpState extends State<TekrarSignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TekrarTopTittles(title: "Hesap Oluştur", subtitle: "Kayıt Ol"),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(Icons.person_2_outlined)
              ),
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "E-Mail",
                prefixIcon: Icon(Icons.email)
              ),
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                hintText: "Phone",
                prefixIcon: Icon(Icons.phone)
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              controller: password,
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
            TekrarPrimaryButton(title: "Hesap Oluştur",onPressed: () async{
              bool isValidate = tekrarSignUpValidate(email.text, password.text, name.text, phone.text);
              if(isValidate){
                bool isLogined = await TekrarAuthService.instance.tekrarKayit(email.text, password.text, context);
                if(isLogined){
                  TekrarRoutes.instance.tekrarPushAndRemove(widget: TekrarHome(), context: context);
                }
              }
            },),
            Text("Zaten HEsabın Var Mı?"),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){},
              child: Text("Giriş Yap",style: TextStyle(color: Theme.of(context).primaryColor),)),
          ],
        ),
      ),
    );
  }
}