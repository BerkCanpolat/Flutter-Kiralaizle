import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/Service/FirebaseAuth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/screens/auth/login/login.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';
import 'package:flutter_kiralaizle/widgets/kiralaizletitle.dart';
import 'package:flutter_kiralaizle/widgets/primaryButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isVisible = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KiralaizleTitle(title: "Üye Ol", subtitle: "Kiralaİzle'ye Tekrar Hoşgeldin"),
              SizedBox(height: kToolbarHeight,),
              TextFormField(
                controller: name,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person_2_outlined)
                ),
              ),
              SizedBox(height: 15,),
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
                controller: phone,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone",
                  prefixIcon: Icon(Icons.phone)
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
              PrimaryButton(title: "Üye Ol",onPressed: () async{
                bool isValidate = signUpValidate(email.text, password.text, name.text, phone.text);
                if(isValidate){
                  bool isLogined = await AuthService.instance.signUpService(name.text, email.text, password.text, context);
                  if(isLogined){
                    MainRoutes.instance.pushAndRemoveBack(widget: Login(), context: context);
                  }
                }
              },),
              SizedBox(height: 15,),
              Center(child: Text("Zaten Üye Misin?")),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  MainRoutes.instance.pushMain(widget: Login(), context: context);
                },
                child: Center(child: Text("Hemen Giriş Yap",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 18),))),
            ],
          ),
        ),
      ),
    );
  }
}