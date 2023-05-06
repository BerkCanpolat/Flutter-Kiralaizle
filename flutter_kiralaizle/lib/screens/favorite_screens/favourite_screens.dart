import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/cart_screen/widget/single_cart_screen.dart';
import 'package:flutter_kiralaizle/screens/favorite_screens/widgets/single_favorite.dart';
import 'package:provider/provider.dart';

class FavouriteCartScreen extends StatefulWidget {
  const FavouriteCartScreen({super.key});

  @override
  State<FavouriteCartScreen> createState() => _FavouriteCartScreenState();
}

class _FavouriteCartScreenState extends State<FavouriteCartScreen> {
  
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Favori Listesi",style: TextStyle(color: Colors.black),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: appProvider.getFavouriteProduct.length,
          itemBuilder: (context, index) {
            return SingleFavouriteScreen(singleProduct: appProvider.getFavouriteProduct[index],);
          },
        ),
      ),
    );
  }
}
