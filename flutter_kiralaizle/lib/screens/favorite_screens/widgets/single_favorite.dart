import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:provider/provider.dart';

class SingleFavouriteScreen extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteScreen({super.key,required this.singleProduct});

  @override
  State<SingleFavouriteScreen> createState() => _SingleFavouriteScreenState();
}

class _SingleFavouriteScreenState extends State<SingleFavouriteScreen> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 3.0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                          child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(widget.singleProduct.image!,fit: BoxFit.cover,)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(widget.singleProduct.name!),
                                Text("${widget.singleProduct.price}"),
                              ],
                            ),
                            SizedBox(height: 15,),
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
                                  child: CircleAvatar(
                                      maxRadius: 13,
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                ),
                                Text(qty.toString()),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        qty++;
                                      });
                                    },
                                    child: CircleAvatar(
                                        maxRadius: 13,
                                        backgroundColor: Colors.black,
                                        child: Icon(Icons.add)))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text("Alışveriş Listene Ekle"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    appProvider.removeFavouriteCart(widget.singleProduct);
                                    showMessage("Film Favoriden Silindi!");
                                  },
                                  child: Icon(Icons.delete,color: Colors.red,)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}