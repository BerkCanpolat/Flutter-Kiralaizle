import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TekrarTopTittles extends StatelessWidget {
  final String title,subtitle;
  const TekrarTopTittles({super.key,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kToolbarHeight,),
        if(title == "Giriş" || subtitle == "Kayıt Ol")
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios)),
        Text(title),
        Text(subtitle),
      ],
    );
  }
}
