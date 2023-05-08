import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/Service/FirebaseAuth.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/widgets/primaryButton.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şifre Değiştir",style: TextStyle(color: Colors.black),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            TextFormField(
              obscureText: isVisible,
              controller: newPassword,
              decoration: InputDecoration(
                hintText: "Yeni Şifre",
                prefixIcon: Icon(Icons.password),
                suffixIcon: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(isVisible ? Icons.visibility : Icons.visibility_off,color: Colors.black,),
                  ),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: isVisible,
              controller: confirmPassword,
              decoration: InputDecoration(
                hintText: "Şifreyi Onayla",
                prefixIcon: Icon(Icons.password),
                suffixIcon: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(isVisible ? Icons.visibility : Icons.visibility_off,color: Colors.black,),
                  ),
              ),
            ),
            SizedBox(height: 40,),
            PrimaryButton(title: "Güncelle", onPressed: () async{
              bool isValidate = changePasword(newPassword.text, confirmPassword.text);
              if(isValidate){
                if(newPassword.text == confirmPassword.text){
                  await AuthService.instance.changePassword(newPassword.text, context);
                }

              }
            },)
          ],
        ),
      ),
    );
  }
}