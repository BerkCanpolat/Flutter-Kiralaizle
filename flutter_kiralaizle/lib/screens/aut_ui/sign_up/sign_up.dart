import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/widgets/primary_button/primary_button.dart';
import 'package:flutter_kiralaizle/widgets/top_titles/top_titles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = true;
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: GeneralPadding.instace.generalPadding.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(
                  title: "Hesap Oluştur",
                  subtitle: "FilmKİrala'ya Hoşgeldiniz"),
              SizedBox(
                height: kToolbarHeight,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "İsim",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: "Telefon",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: sifre,
                obscureText: isVisible,
                decoration: InputDecoration(
                  hintText: "Şifre",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: isVisible
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: kToolbarHeight,
              ),
              PrimaryButton(
                title: "Hesap Oluştur",
                onPressed: () {},
              ),
              SizedBox(
                height: kToolbarHeight,
              ),
              Center(
                child: Text("Zaten Hesabın Var Mı?"),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.zero,
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
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
