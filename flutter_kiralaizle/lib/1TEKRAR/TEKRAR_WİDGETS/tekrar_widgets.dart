import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TekrarTitle extends StatelessWidget {
  final String title,subtitle;
  const TekrarTitle({super.key,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kToolbarHeight,),
        if(title == "Login" || subtitle == "Sign Up")
        GestureDetector(child: Icon(Icons.arrow_back_ios), onTap: (){Navigator.of(context).pop();}),
          Text(title),
          Text(subtitle),
      ],
    );
  }
}