import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:provider/provider.dart';

class SingleCard extends StatefulWidget {
  final ProductModel cartProduct;
  const SingleCard({super.key,required this.cartProduct});

  @override
  State<SingleCard> createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  int qty = 1;

  @override
  void initState() {
    qty = widget.cartProduct.qty??1;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red,width: 3),
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
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: CircleAvatar(
                      maxRadius: 13,
                      child: Icon(Icons.remove),
                      ), 
                    onPressed: (){
                    if(qty > 1){
                      setState(() {
                        qty--;
                      });
                    }
                    }
                    ),
                    Text(qty.toString()),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: CircleAvatar(
                      maxRadius: 13,
                      child: Icon(Icons.add),
                      ), 
                    onPressed: (){
                      setState(() {
                        qty++;
                      });
                    }
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){},
                  child: Text("Add to wishlist")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
                      appProvider.removeCartProduct(widget.cartProduct);
                      showMessage("Film Kaldırıldı!");
                    },
                    child: Icon(Icons.delete),
                    ),
                  ],
                  ),
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