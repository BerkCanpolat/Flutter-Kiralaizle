import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:provider/provider.dart';

class SingleCardScreen extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCardScreen({super.key,required this.singleProduct});

  @override
  State<SingleCardScreen> createState() => _SingleCardScreenState();
}

class _SingleCardScreenState extends State<SingleCardScreen> {
  int qty = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qty = widget.singleProduct.qty ?? 1;
  }
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
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                          child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(widget.singleProduct.image!,fit: BoxFit.cover,)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
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
                            SizedBox(height: 10,),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                if(!appProvider.getFavouriteProduct.contains(widget.singleProduct)){
                                  appProvider.addFavouriteCart(widget.singleProduct);
                                  showMessage("Alışveriş Listesine Eklendi");
                                }else{
                                  appProvider.removeFavouriteCart(widget.singleProduct);
                                  showMessage("Alışveris Listesinden Çıkarıldı!");
                                }
                              },
                              child: Text(
                                appProvider.getFavouriteProduct.contains(widget.singleProduct) ? "Alışveriş Listenden Çıkar" : "Alışveriş Listene Ekle",
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
                                    appProvider.removeCart(widget.singleProduct);
                                    showMessage("Film Listenden Silindi!");
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