import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/screens/account_screen/account_screen.dart';
import 'package:flutter_kiralaizle/screens/cart_screen/cart_screen.dart';
import 'package:flutter_kiralaizle/screens/favorite_screens/favourite_screens.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  var sayfaDeis = [Home(),CartScreen(),FavouriteCartScreen(),AccountScreen()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaDeis[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Home"
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      )
    );
  }
}