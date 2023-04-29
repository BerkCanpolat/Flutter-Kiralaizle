import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_images.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_routes.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_primarybutton.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_widgets.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_login/tekrar_login.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_signup/tekrar_signup.dart';

class TekrarWelcome extends StatelessWidget {
  const TekrarWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TekrarTitle(
              title: "Welcome", subtitle: "Buy AnyItems From Using App"),
          Image.asset(TekrarImages.instance.welcomeImage),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(onPressed: () {}, child: Icon(Icons.facebook)),
              CupertinoButton(
                  onPressed: () {},
                  child: Image.asset(
                    TekrarImages.instance.welcomGoogleLogo,
                    scale: 40,
                  )),
            ],
          ),
          TekrarPrimaryButton(
            title: "Login",
            onPressed: () {
              TekrarRoutes.instance.push(widget: TekrarLogin(), context: context);
            },
          ),
          TekrarPrimaryButton(
            title: "Sign Up",
            onPressed: () {
              TekrarRoutes.instance.push(widget: TekrarSignUp(), context: context);
            },
          ),
        ],
      ),
    );
  }
}
