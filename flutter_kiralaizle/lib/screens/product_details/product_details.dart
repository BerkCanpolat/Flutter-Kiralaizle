import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/cart_screen/cart_screen.dart';
import 'package:flutter_kiralaizle/widgets/primary_button/primary_button.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productDetails;
  const ProductDetails({super.key,required this.productDetails});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            MainRoutes.instance.push(widget: CartScreen(), context: context);
          }, icon: Icon(Icons.shopify_sharp)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: GeneralPadding.instace.generalPadding.padding,
          child: Column(
            children: [
              Image.network(widget.productDetails.image!,width: 400,height: 400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.productDetails.name!),
                  Icon(Icons.favorite_border),
                ],
              ),
              SizedBox(height: 15,),
              Text(widget.productDetails.description!),
              Row(
                children: [
                  CupertinoButton(
                    child: CircleAvatar(child: Icon(Icons.remove)), 
                    onPressed: (){
                    if(qty > 1){
                      setState(() {
                        qty--;
                      });
                    }
                    }
                    ),
                    Text(qty.toString()),
                  CupertinoButton(
                    child: CircleAvatar(child: Icon(Icons.add)), 
                    onPressed: (){
                      setState(() {
                        qty++;
                      });
                    }
                    ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 145,
                    child: OutlinedButton(
                      onPressed: (){
                        AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
                        appProvider.addCartProduct(widget.productDetails);
                        showMessage("Film Kart'a Eklendi!");
                      }, 
                      child: Text("Karta Ekle"),
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    width: 145,
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Text("Satın al"),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}