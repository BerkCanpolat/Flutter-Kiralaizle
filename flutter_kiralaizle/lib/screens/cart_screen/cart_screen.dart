import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/cart_screen/widget/single_card_items.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kart Ekranı",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: GeneralPadding.instace.generalPadding.padding,
        itemCount: appProvider.getCardProductList.length,
        itemBuilder: (context, index) {
          return SingleCard(cartProduct: appProvider.getCardProductList[index],);
        },
      ),
    );
  }
}