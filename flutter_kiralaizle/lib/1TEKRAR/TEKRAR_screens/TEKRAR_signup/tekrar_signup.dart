import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_constants.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_routes.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_primarybutton.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_widgets.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_home/tekrar_home.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_service/TEKRAR_auth/tekrar_auth.dart';

class TekrarSignUp extends StatefulWidget {
  const TekrarSignUp({super.key});

  @override
  State<TekrarSignUp> createState() => _TekrarLoginState();
}

class _TekrarLoginState extends State<TekrarSignUp> {

  bool isVisible = true;
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
          TekrarTitle(title: "Login", subtitle: "Welcome Back To E Commerce App"),
          SizedBox(height: 10,),
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              hintText: "Name",
              prefixIcon: Icon(Icons.person_2_outlined),
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: "E-Mail",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: phone,
            decoration: InputDecoration(
              hintText: "Phone",
              prefixIcon: Icon(Icons.phone),
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
          TekrarPrimaryButton(title: "Create An Account",onPressed: () async{
            bool isValidate = tekrarKayitValidate(email.text, password.text, name.text, phone.text);
            if(isValidate){
              bool isLogined = await TekrarService.instance.tekrarKayit(email.text, password.text, context);
              if(isLogined){
                TekrarRoutes.instance.pushAndNotBack(widget: TekrarHome(), context: context);
              }
            }
          },),
          Text("I Have already an account?"),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: (){},
            child: Text("Login",style: TextStyle(color: Theme.of(context).primaryColor),))
        ],
      ),
    );
  }
}