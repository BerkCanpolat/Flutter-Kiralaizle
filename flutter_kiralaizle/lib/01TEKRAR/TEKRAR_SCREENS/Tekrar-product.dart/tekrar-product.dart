import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-routes.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_cart_screenss/tekrar-cart-screens.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_favourite/tekrar-favouritescreen.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarProductDetails extends StatefulWidget {
  final ProductModel productModel;
  const TekrarProductDetails({super.key, required this.productModel});

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
        title: Text("Product Detail"),
        actions: [
          IconButton(
              onPressed: () {
                TekrarRoutes.instance
                    .tekrarPush(widget: TekrarCartScreens(), context: context);
              },
              icon: Icon(Icons.shop))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.productModel.image!,
              width: 400,
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.productModel.name!),
                CupertinoButton(
                    onPressed: () {
                      setState(() {
                        widget.productModel.isFavourite =
                            !widget.productModel.isFavourite!;
                      });
                      if (widget.productModel.isFavourite!) {
                        provider.tekrarFavouritedAdd(widget.productModel);
                        showMessage("Favoriye eklendi");
                      } else {
                        provider.tekrarFavouriteRemove(widget.productModel);
                        showMessage("Favoriden kaldırıldı");
                      }
                    },
                    child: Icon(provider.getFavourite
                            .contains(widget.productModel)
                        ? Icons.favorite
                        : Icons.favorite_border)),
              ],
            ),
            Text(widget.productModel.description!),
            Row(
              children: [
                CupertinoButton(
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
                ElevatedButton(
                  onPressed: () {
                    ProductModel model = widget.productModel.copyWith(qty: qty);
                    provider.tekrarCardAdd(model);
                    showMessage("Kart Listeye Eklendi!");
                  },
                  child: Text("Add to cart"),
                ),
                ElevatedButton(
                  onPressed: () {
                    TekrarRoutes.instance.tekrarPush(widget: TekrarFavouritecreens(), context: context);
                  },
                  child: Text("Buy"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
