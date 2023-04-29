import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_constants.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_routes.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_Provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_cart/tekrar_cart_screen.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarProductDetails extends StatefulWidget {
  final ProductModel tekrarProdDetay;
  const TekrarProductDetails({super.key,required this.tekrarProdDetay});

  @override
  State<TekrarProductDetails> createState() => _TekrarProductDetailsState();
}

class _TekrarProductDetailsState extends State<TekrarProductDetails> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            TekrarRoutes.instance.push(widget: TekrarCartScreen(), context: context);
          }, icon: Icon(Icons.shopify_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.tekrarProdDetay.image!,width: 400,height: 400,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.tekrarProdDetay.name!),
                Icon(Icons.favorite),
              ],
            ),
            Text(widget.tekrarProdDetay.description!),
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    if(qty > 1){
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  child: Icon(Icons.remove)),
                Text(qty.toString()),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      qty++;
                    });
                  },
                  child: Icon(Icons.add)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){
                  TekrarProvider provider = Provider.of<TekrarProvider>(context,listen: false);
                  provider.tekrarAddCard(widget.tekrarProdDetay);
                  tekrarShowMessage("Add to card");
                }, child: Text("Add Card")),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){}, child: Text("Buy")),
              ],
            )
          ],
        ),
      ),
    );
  }
}