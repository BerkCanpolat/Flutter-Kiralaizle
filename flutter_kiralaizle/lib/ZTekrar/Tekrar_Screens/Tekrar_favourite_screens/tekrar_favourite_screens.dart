import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_cart_screen/tekrar_singlecart.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_favourite_screens/tekrar_singlefavourite.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_provider/tekrar_provider.dart';
import 'package:provider/provider.dart';

class TekrarFavouriteScreen extends StatefulWidget {
  const TekrarFavouriteScreen({super.key});

  @override
  State<TekrarFavouriteScreen> createState() => _TekrarCartScreenState();
}

class _TekrarCartScreenState extends State<TekrarFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    TekrarProvider provider = Provider.of<TekrarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favori Ekranı"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: provider.tekrarGetFavouriteProductList.length,
        itemBuilder: (context, index) {
          return TekrarSingleFavouriteCard(singleProduct: provider.tekrarGetFavouriteProductList[index],);
        },
      ),
    );
  }
}
