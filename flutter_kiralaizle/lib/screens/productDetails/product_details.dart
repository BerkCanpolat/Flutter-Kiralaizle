import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/cart_screen/cart_screen.dart';
import 'package:flutter_kiralaizle/screens/favorite_screens/favourite_screens.dart';
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
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productDetails.name!,style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            MainRoutes.instance.pushMain(widget: CartScreen(), context: context);
          }, icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.productDetails.image!,width: 400,height: 400,),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.productDetails.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      widget.productDetails.isFavourite = !widget.productDetails.isFavourite!;
                    });
                    if(widget.productDetails.isFavourite!){
                      appProvider.addFavouriteCart(widget.productDetails);
                      showMessage("Film Favorilere Eklendi!");
                    }else{
                      appProvider.removeFavouriteCart(widget.productDetails);
                      showMessage("Film Favorilerden Kaldırıldı!");
                    }
                  },
                  child: Icon(appProvider.getFavouriteProduct.contains(widget.productDetails) ? Icons.favorite : Icons.favorite_border)),
              ],
            ),
            SizedBox(height: kToolbarHeight,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(widget.productDetails.description!),
            ),
            SizedBox(height: kToolbarHeight,),
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
                  }, child: CircleAvatar(
                    maxRadius: 16,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.remove,color: Colors.white,)
                    ),
                    ),
                    SizedBox(width: 5,),
                Text(qty.toString()),
                SizedBox(width: 5,),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {
                      qty++;
                    });
                  }, child: CircleAvatar(
                    maxRadius: 16,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.add)))
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: OutlinedButton(onPressed: (){
                    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
                    ProductModel model = widget.productDetails.copyWith(qty: qty);
                    appProvider.addCart(model);
                    showMessage("Film Karta Eklendi!");
                  }, child: Text("Karta Ekle",style: TextStyle(color: Colors.black),),)),
                SizedBox(width: 30,),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    MainRoutes.instance.pushMain(widget: FavouriteCartScreen(), context: context);
                  }, child: Text("Satın Al"),)),
              ],
            ),
            SizedBox(height: kToolbarHeight,),
          ],
        ),
      ),
    );
  }
}