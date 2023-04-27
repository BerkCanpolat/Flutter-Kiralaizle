import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productDetails;
  const ProductDetails({super.key,required this.productDetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: GeneralPadding.instace.generalPadding.padding,
          child: Column(
            children: [
              Image.network(productDetails.image!,width: 400,height: 400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productDetails.name!),
                  Icon(Icons.favorite_border),
                ],
              ),
              SizedBox(height: 15,),
              Text(productDetails.description!),
              Row(
                children: [
                  CupertinoButton(
                    child: CircleAvatar(child: Icon(Icons.remove)), 
                    onPressed: (){}
                    ),
                    Text("0"),
                  CupertinoButton(
                    child: CircleAvatar(child: Icon(Icons.add)), 
                    onPressed: (){}
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}