import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarSingleFavourite extends StatefulWidget {
  final ProductModel singleProduct;
  const TekrarSingleFavourite({super.key,required this.singleProduct});

  @override
  State<TekrarSingleFavourite> createState() => _TekrarSingleCartState();
}

class _TekrarSingleCartState extends State<TekrarSingleFavourite> {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red,width: 3.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 140,
                    color: Colors.black,
                    child: Image.network(widget.singleProduct.image!),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 140,
                    color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(widget.singleProduct.name!),
                            Text("${widget.singleProduct.price!}"),
                          ],
                        ),
            Text("Listeye ekle"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    TekrarProvider provider = Provider.of<TekrarProvider>(context,listen: false);
                    provider.tekrarFavouriteRemove(widget.singleProduct);
                    showMessage("Kart Silindi!");
                  },
                  child: Icon(Icons.delete)),
              ],
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