import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_Provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_cart/tekrar_widget/tekrar_single_cart.dart';
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
        title: Text(
          "Cart Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: provider.tekrarGetCardProductList.length,
        itemBuilder: (context, index) {
          return TekrarSingleCard(tekrarSingle: provider.tekrarGetCardProductList[index],);
        },
      ),
    );
  }
}
