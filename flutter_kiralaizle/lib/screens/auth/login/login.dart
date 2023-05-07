import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/Service/FirebaseAuth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/screens/auth/signup/signUp.dart';
import 'package:flutter_kiralaizle/screens/bottom_navigation_screen/bottom_navigation.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';
import 'package:flutter_kiralaizle/widgets/kiralaizletitle.dart';
import 'package:flutter_kiralaizle/widgets/primaryButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isVisible = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.text;
    password.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KiralaizleTitle(title: "Giriş", subtitle: "Kiralaİzle'ye Tekrar Hoşgeldin"),
            SizedBox(height: kToolbarHeight,),
            TextFormField(
              controller: email,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "E-mail",
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: password,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              obscureText: isVisible,
              decoration: InputDecoration(
                hintText: "Şifre",
                prefixIcon: Icon(Icons.password),
                suffixIcon: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(isVisible ? Icons.visibility : Icons.visibility_off,color: Colors.black,)),
              ),
            ),
            SizedBox(height: kToolbarHeight,),
            PrimaryButton(title: "Giriş Yap",onPressed: () async{
              bool isValidate = loginValidate(email.text, password.text);
              if(isValidate){
                bool isLogined = await AuthService.instance.loginService(email.text, password.text, context);
                if(isLogined){
                  MainRoutes.instance.pushAndRemoveBack(widget: BottomNavigationScreen(), context: context);
                }
              }
            },),
            SizedBox(height: 15,),
            Center(child: Text("Henüz Hesabın Yok Mu?")),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                MainRoutes.instance.pushMain(widget: SignUp(), context: context);
              },
              child: Center(child: Text("Hemen Üye Ol",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 18),))),
          ],
        ),
      ),
    );
  }
}