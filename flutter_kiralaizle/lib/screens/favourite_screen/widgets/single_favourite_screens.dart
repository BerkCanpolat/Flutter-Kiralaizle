import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:provider/provider.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel cartProduct;
  const SingleFavouriteItem({super.key, required this.cartProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 148,
              color: Colors.pink.withOpacity(0.3),
              child: Image.network(widget.cartProduct.image!),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 148,
              color: Colors.white.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.cartProduct.name!),
                      Text("\$${widget.cartProduct.price.toString()}"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          AppProvider appProvider =
                              Provider.of<AppProvider>(context, listen: false);
                          appProvider.removeFavouriteProduct(widget.cartProduct);
                          showMessage("Favoriden Kaldırıldı!");
                        },
                        child: Text("Removed to wishlist")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
