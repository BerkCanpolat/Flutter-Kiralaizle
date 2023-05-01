import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_cart_screen/tekrar_cart_screen.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_favourite_screens/tekrar_favourite_screens.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_routes.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_primaryButton.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/screens/product_details/product_details.dart';
import 'package:provider/provider.dart';

class TekrarProductDetails extends StatefulWidget {
  final ProductModel productDetails;
  const TekrarProductDetails({super.key, required this.productDetails});

  @override
  State<TekrarProductDetails> createState() => _TekrarProductDetailsState();
}

class _TekrarProductDetailsState extends State<TekrarProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    TekrarProvider provider = Provider.of<TekrarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Detayı"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                TekrarRoutes.instance
                    .tekrarPush(widget: TekrarCartScreen(), context: context);
              },
              icon: Icon(Icons.shopify_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.productDetails.image!,
              width: 400,
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.productDetails.name!),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.productDetails.isFavourite = !widget.productDetails.isFavourite!;
                    });
                    if(widget.productDetails.isFavourite!){
                      provider.tekrarFavouritedAdd(widget.productDetails);
                      tekrarMESAJ("Favoriye Eklendi!");
                    }else{
                      provider.tekrarFavouriteRemove(widget.productDetails);
                      tekrarMESAJ("Favoriden Çıkarıldı!");
                    }
                  },
                  icon: Icon(provider.tekrarGetFavouriteProductList
                          .contains(widget.productDetails)
                      ? Icons.favorite
                      : Icons.favorite_border),
                ),
              ],
            ),
            Text(widget.productDetails.description!),
            Row(
              children: [
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (qty > 1) {
                        setState(() {
                          qty--;
                        });
                      }
                    },
                    child: Icon(Icons.remove)),
                Text(qty.toString()),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    child: Icon(Icons.add)),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    ProductModel model =
                        widget.productDetails.copyWith(qty: qty);
                    provider.tekrarCardAdd(model);
                    tekrarMESAJ("Film Kart'a Eklendi!");
                  },
                  child: Text("Karta Ekle"),
                ),
                OutlinedButton(
                  onPressed: () {
                    TekrarRoutes.instance.tekrarPush(widget: TekrarFavouriteScreen(), context: context);
                  },
                  child: Text("Satın Al"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
