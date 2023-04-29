import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_constants.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_routes.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_primarybutton.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_widgets.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_home/tekrar_home.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_signup/tekrar_signup.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_service/TEKRAR_auth/tekrar_auth.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TekrarTitle(title: "Login", subtitle: "Welcome Back To E Commerce App"),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: "E-Mail",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 10,),
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
                child:isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
            ),
          ),
          TekrarPrimaryButton(title: "Login",onPressed: () async{
            bool isValidate = tekrarGirisValidate(email.text, password.text);
            if(isValidate){
              bool isLogined = await TekrarService.instance.tekrarGiris(email.text, password.text, context);
              if(isLogined){
                TekrarRoutes.instance.pushAndNotBack(widget: TekrarHome(), context: context);
              }
            }
          },),
          Text("Don't have an account?"),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              TekrarRoutes.instance.push(widget: TekrarSignUp(), context: context);
            },
            child: Text("Create An Account",style: TextStyle(color: Theme.of(context).primaryColor),))
        ],
      ),
    );
  }
}