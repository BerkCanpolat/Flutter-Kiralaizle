import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/constants/assets_images.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/screens/aut_ui/login/login.dart';
import 'package:flutter_kiralaizle/widgets/primary_button/primary_button.dart';
import 'package:flutter_kiralaizle/widgets/top_titles/top_titles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(title: "Hoşgeldin", subtitle: "İstediğin Zaman İstediğin Yerde Kirala Ve İzle!"),
            SizedBox(
              height: kToolbarHeight + 50,
            ),
            Center(
              child: Image.asset(MainAssets.instance.welcomeImage),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Image.asset(
                        MainAssets.instance.googlelogo,
                        scale: 26,
                      )),
                ],
              ),
            ),
            SizedBox(height: 35,),
            PrimaryButton(title: "Giriş Yap", onPressed: (){
              MainRoutes.instance.push(widget: Login(), context: context);
            },),
            SizedBox(height: 20,),
            PrimaryButton(title: "Kayıt Ol", onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
