import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_constants.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_Provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarSingleCard extends StatefulWidget {
  final ProductModel tekrarSingle;
  const TekrarSingleCard({super.key,required this.tekrarSingle});

  @override
  State<TekrarSingleCard> createState() => _TekrarSingleCardState();
}

class _TekrarSingleCardState extends State<TekrarSingleCard> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 140,
                    color: Colors.pink.withOpacity(0.3),
                    child: Image.network(widget.tekrarSingle.image!),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 140,
                    color: Colors.black.withOpacity(0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(widget.tekrarSingle.name!),
                            Text("${widget.tekrarSingle.price}"),
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
                        Text("Add to wishlist"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                              onPressed: (){
                                TekrarProvider provider = Provider.of<TekrarProvider>(context, listen: false);
                                provider.tekrarRemoveCard(widget.tekrarSingle);
                                tekrarShowMessage("Card Deleted");
                              },
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