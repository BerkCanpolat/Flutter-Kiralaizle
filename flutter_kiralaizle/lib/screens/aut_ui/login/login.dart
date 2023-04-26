import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/FirebaseServices/AuthServices/firebase_auth_service.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/screens/aut_ui/sign_up/sign_up.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';
import 'package:flutter_kiralaizle/widgets/primary_button/primary_button.dart';
import 'package:flutter_kiralaizle/widgets/top_titles/top_titles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: GeneralPadding.instace.generalPadding.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(title: "Giriş Yap", subtitle: "FilmKirala'ya Tekrar Hoş Geldiniz"),
              SizedBox(height: kToolbarHeight,),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: sifre,
                obscureText: isVisible,
                decoration: InputDecoration(
                  hintText: "Şifre",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: CupertinoButton(
                    onPressed: (){
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: isVisible ? Icon(Icons.visibility_off,color: Colors.grey,) : Icon(Icons.visibility,color: Colors.grey,),
                    ),
                ),
              ),
              SizedBox(height: kToolbarHeight,),
              PrimaryButton(title: "Giriş Yap", onPressed: () async{
                bool isValidate = loginValidation(email.text, sifre.text);
                if(isValidate){
                  bool isLogined = await AuthService.instance.login(email.text, sifre.text, context);
                  if(isLogined){
                    MainRoutes.instance.pushAndRemoveUntil(widget: Home(), context: context);
                  }
                }
              },),
              SizedBox(height: kToolbarHeight,),
              Center(
                child: Text("Henüz Hesabın Yok Mu?"),
                ),
              SizedBox(height: 20,),
              Center(
                child: CupertinoButton(
                onPressed: (){
                  MainRoutes.instance.push(widget: SignUp(), context: context);
                },
                padding: EdgeInsets.zero,
                child: Text("Hesap Oluştur",style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}