import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarSingleCart extends StatefulWidget {
  final ProductModel singleProduct;
  const TekrarSingleCart({super.key, required this.singleProduct});

  @override
  State<TekrarSingleCart> createState() => _TekrarSingleCartState();
}

class _TekrarSingleCartState extends State<TekrarSingleCart> {
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 3.0),
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
                  GestureDetector(
                    onTap: () {
                      if(!provider.getFavourite.contains(widget.singleProduct)){
                        provider.tekrarFavouritedAdd(widget.singleProduct);
                        showMessage("Karttan fava eklendi");
                      }else{
                        provider.tekrarFavouriteRemove(widget.singleProduct);
                        showMessage("Karttan fava çıkarıldı");
                      }
                    },
                    child: Text(
                        provider.getFavourite.contains(widget.singleProduct)
                            ? "Listeden Çıkar"
                            : "Listeye ekle"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            TekrarProvider provider =
                                Provider.of<TekrarProvider>(context,
                                    listen: false);
                            provider.tekrarCardRemove(widget.singleProduct);
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
