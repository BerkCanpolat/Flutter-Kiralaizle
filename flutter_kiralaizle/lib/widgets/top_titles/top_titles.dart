import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;
  const TopTitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            SizedBox(
              height: kToolbarHeight,
            ),
        if(title == 'Giriş Yap' || title == 'Hesap Oluştur')
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios)
              ),
              SizedBox(height: 20,),
            Text(title,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            SizedBox(height: 12,),
            Text(subtitle,style: TextStyle(
              fontSize: 18
            ),),
      ],
    );
  }
}