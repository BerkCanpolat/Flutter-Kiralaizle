import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_cart_screen/tekrar_singlecart.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_provider/tekrar_provider.dart';
import 'package:provider/provider.dart';

class TekrarCartScreen extends StatefulWidget {
  const TekrarCartScreen({super.key});

  @override
  State<TekrarCartScreen> createState() => _TekrarCartScreenState();
}

class _TekrarCartScreenState extends State<TekrarCartScreen> {
  @override
  Widget build(BuildContext context) {
    TekrarProvider provider = Provider.of<TekrarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kart Ekranı"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: provider.tekrarGetCardProductList.length,
        itemBuilder: (context, index) {
          return TekrarSingleCard(singleProduct: provider.tekrarGetCardProductList[index],);
        },
      ),
    );
  }
}
