import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_routes.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_product_details/tekrar_product_details.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_service/TEKRAR_firestore/tekrar_firestore.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarCategoriesDetails extends StatefulWidget {
  final CategoryModel tekrarCat;
  const TekrarCategoriesDetails({super.key,required this.tekrarCat});

  @override
  State<TekrarCategoriesDetails> createState() => _TekrarCategoriesDetailsState();
}

class _TekrarCategoriesDetailsState extends State<TekrarCategoriesDetails> {
  List<ProductModel> tekrarProductHome = [];
  bool isLoading = true;

  void tekrarDisplay() async {
    setState(() {
      isLoading = true;
    });
    tekrarProductHome = await TekrarStore.instance.tekrarCategoriesView(widget.tekrarCat.id);
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
      appBar: AppBar(
        title: Text(widget.tekrarCat.name),
      ),
      body: Column(
        children: [
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
    );
  }
}