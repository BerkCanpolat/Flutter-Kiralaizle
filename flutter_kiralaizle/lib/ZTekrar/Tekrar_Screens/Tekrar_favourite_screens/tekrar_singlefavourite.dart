import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarSingleFavouriteCard extends StatefulWidget {
  final ProductModel singleProduct;
  const TekrarSingleFavouriteCard({super.key, required this.singleProduct});

  @override
  State<TekrarSingleFavouriteCard> createState() => _TekrarSingleCardState();
}

class _TekrarSingleCardState extends State<TekrarSingleFavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.pink,
          width: 3.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 149,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image.network(
                widget.singleProduct.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 149,
              color: Colors.brown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.singleProduct.name!),
                      Text("${widget.singleProduct.price}"),
                    ],
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        TekrarProvider provider =
                            Provider.of<TekrarProvider>(context, listen: false);
                        provider.tekrarFavouriteRemove(widget.singleProduct);
                        tekrarMESAJ("Favori Listenden Silindi!");
                      },
                      child: Text(
                        "Favori Listenden Kaldır",
                        style: TextStyle(fontSize: 13),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
