import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_categoryView/tekrar_categoryView.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_productdetails/tekrar_product_detals.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_routes.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_service/tekrar_firestore.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_widgets/tekrar_toptittles.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarHome extends StatefulWidget {
  const TekrarHome({super.key});

  @override
  State<TekrarHome> createState() => _TekrarHomeState();
}

class _TekrarHomeState extends State<TekrarHome> {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  bool isLoading = true;

  void categoryDisplay() async {
    setState(() {
      isLoading = true;
    });
    categoryList = await TekrarStoreService.instance.tekrarCategory();
    productList = await TekrarStoreService.instance.tekrarProduct();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TekrarTopTittles(title: "E Film", subtitle: ""),
            TextFormField(
              decoration: InputDecoration(hintText: "Ara.."),
            ),
            TekrarTopTittles(title: "Categories", subtitle: ""),
            categoryList.isEmpty ? Text("Kategori Listesi Boş") : SingleChildScrollView(
              padding: EdgeInsets.only(left: 8),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryList
                    .map((e) => CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            TekrarRoutes.instance.tekrarPush(widget: TekrarCategoryViews(categoryDetail: e), context: context);
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
                        ))
                    .toList(),
              ),
            ),
            TekrarTopTittles(title: "Best Products", subtitle: ""),
            productList.isEmpty ? Text("Product Listesi Boş") : GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.6
                    ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                ProductModel product = productList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.network(product.image!,width: 200,height: 200,),
                      Text(product.name!),
                      Text("${product.price}"),
                      OutlinedButton(onPressed: (){
                        TekrarRoutes.instance.tekrarPush(widget: TekrarProductDetails(productDetails: product), context: context);
                      }, child: Text("Satın Al"),),
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
