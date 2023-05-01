import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_constants.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarSingleCard extends StatefulWidget {
  final ProductModel singleProduct;
  const TekrarSingleCard({super.key, required this.singleProduct});

  @override
  State<TekrarSingleCard> createState() => _TekrarSingleCardState();
}

class _TekrarSingleCardState extends State<TekrarSingleCard> {
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qty = widget.singleProduct.qty ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    TekrarProvider provider = Provider.of<TekrarProvider>(context);
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
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (!provider.tekrarGetFavouriteProductList
                            .contains(widget.singleProduct)) {
                              provider.tekrarFavouritedAdd(widget.singleProduct);
                        } else {
                          provider.tekrarFavouriteRemove(widget.singleProduct);
                        }
                      },
                      child: Text(
                        provider.tekrarGetFavouriteProductList
                                .contains(widget.singleProduct)
                            ? "Favoriden Kaldır"
                            : "Favori Listene Ekle",
                        style: TextStyle(fontSize: 13),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                          onPressed: () {
                            TekrarProvider provider =
                                Provider.of<TekrarProvider>(context,
                                    listen: false);
                            provider.tekrarCardRemove(widget.singleProduct);
                            tekrarMESAJ("Film Silindi!");
                          },
                          padding: EdgeInsets.zero,
                          child: Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
