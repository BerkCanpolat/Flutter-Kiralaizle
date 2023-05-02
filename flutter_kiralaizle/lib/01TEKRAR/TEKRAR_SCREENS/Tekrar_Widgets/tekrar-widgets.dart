import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TekrarTopTitle extends StatelessWidget {
  final String title,subtitle;
  const TekrarTopTitle({super.key,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kToolbarHeight,),
        if(title == "Login" || title == "SignUp")
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        Text(title),
        Text(subtitle),
      ],
    );
  }
}
