import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_cart_screenss/tekrar-singlecart.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_favourite/tekrar-singlefavourite.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:provider/provider.dart';

class TekrarFavouritecreens extends StatefulWidget {
  const TekrarFavouritecreens({super.key});

  @override
  State<TekrarFavouritecreens> createState() => _TekrarCartScreensState();
}

class _TekrarCartScreensState extends State<TekrarFavouritecreens> {
  @override
  Widget build(BuildContext context) {
    TekrarProvider provider = Provider.of<TekrarProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart Screen"),),
      body: ListView.builder(
        itemCount: provider.getFavourite.length,
        itemBuilder: (context, index) {
          return TekrarSingleFavourite(singleProduct: provider.getFavourite[index],);
        },
      ),
    );
  }
}