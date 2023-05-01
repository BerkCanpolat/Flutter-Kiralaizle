import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/cart_screen/widget/single_card_items.dart';
import 'package:flutter_kiralaizle/screens/favourite_screen/widgets/single_favourite_screens.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favori Ekranı",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: appProvider.getFavouritedProductList.isEmpty ? Center(child: Text("İs Empty"),) : ListView.builder(
        padding: GeneralPadding.instace.generalPadding.padding,
        itemCount: appProvider.getFavouritedProductList.length,
        itemBuilder: (context, index) {
          return SingleFavouriteItem(cartProduct: appProvider.getFavouritedProductList[index],);
        },
      ),
    );
  }
}