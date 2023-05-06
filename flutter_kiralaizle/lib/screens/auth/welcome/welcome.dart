import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/images.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/screens/auth/login/login.dart';
import 'package:flutter_kiralaizle/screens/auth/signup/signUp.dart';
import 'package:flutter_kiralaizle/widgets/kiralaizletitle.dart';
import 'package:flutter_kiralaizle/widgets/primaryButton.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KiralaizleTitle(
                title: "Hoşgeldin",
                subtitle: "İstediğin Zaman İstediğin Yerde Kirala Ve İzle!"),
            SizedBox(
              height: kToolbarHeight + 20,
            ),
            Image.asset(MainImages.instance.welcomeimage),
            SizedBox(
              height: kToolbarHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Icon(
                    Icons.facebook,
                    size: 60,
                  ),
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Image.asset(
                      MainImages.instance.welcomegoogle,
                      scale: 16,
                    ))
              ],
            ),
            Spacer(),
            PrimaryButton(title: "Giriş Yap",onPressed: (){
              MainRoutes.instance.pushMain(widget: Login(), context: context);
            },),
            SizedBox(height: 15,),
            PrimaryButton(title: "Üye Ol",onPressed: (){
              MainRoutes.instance.pushMain(widget: SignUp(), context: context);
            },),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
