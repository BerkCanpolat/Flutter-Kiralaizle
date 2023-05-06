import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class KiralaizleTitle extends StatelessWidget {
  final String title,subtitle;
  const KiralaizleTitle({super.key,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kToolbarHeight,),
        if(title == "Giriş" || title == "Üye Ol")
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){Navigator.pop(context);}),
        Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
        SizedBox(height: 15,),
        Text(subtitle,style: TextStyle(fontSize: 17),),
      ],
    );
  }
}
