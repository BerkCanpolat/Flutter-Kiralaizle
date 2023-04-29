import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_routes.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_W%C4%B0DGETS/tekrar_widgets.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_categories_details/tekrar_categories_details.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_product_details/tekrar_product_details.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_service/TEKRAR_firestore/tekrar_firestore.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarHome extends StatefulWidget {
  const TekrarHome({super.key});

  @override
  State<TekrarHome> createState() => _TekrarHomeState();
}

class _TekrarHomeState extends State<TekrarHome> {
  List<CategoryModel> tekrarCategoryHome = [];
  List<ProductModel> tekrarProductHome = [];
  bool isLoading = true;

  void tekrarDisplay() async {
    setState(() {
      isLoading = true;
    });
    tekrarCategoryHome = await TekrarStore.instance.tekrarCategory();
    tekrarProductHome = await TekrarStore.instance.tekrarProduct();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tekrarDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TekrarTitle(title: "E Commerce", subtitle: ""),
            TextFormField(
              decoration: InputDecoration(hintText: "Search.."),
            ),
            Text("Categories"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: tekrarCategoryHome.map((e) => 
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      TekrarRoutes.instance.push(widget: TekrarCategoriesDetails(tekrarCat: e), context: context);
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 3.0,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(e.image),
                      ),
                    ),
                  ),
                  ).toList(),
                ),
              ),
            ),
            Text("Best Products"),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 25,
              ),
              itemCount: tekrarProductHome.length,
              itemBuilder: (context, index) {
                ProductModel tekrarProduct = tekrarProductHome[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.network(tekrarProduct.image!,width: 200,height: 200,),
                      Text(tekrarProduct.name!),
                      Text("${tekrarProduct.price}"),
                      OutlinedButton(onPressed: (){
                        TekrarRoutes.instance.push(widget: TekrarProductDetails(tekrarProdDetay: tekrarProduct), context: context);
                      }, child: Text("Buy"),),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
