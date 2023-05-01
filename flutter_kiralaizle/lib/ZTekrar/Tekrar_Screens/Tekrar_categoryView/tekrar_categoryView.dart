import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_productdetails/tekrar_product_detals.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_routes.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_service/tekrar_firestore.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarCategoryViews extends StatefulWidget {
  final CategoryModel categoryDetail;
  const TekrarCategoryViews({super.key,required this.categoryDetail});

  @override
  State<TekrarCategoryViews> createState() => _TekrarCategoryViewsState();
}

class _TekrarCategoryViewsState extends State<TekrarCategoryViews> {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  bool isLoading = true;

  void categoryDisplay() async {
    setState(() {
      isLoading = true;
    });
    categoryList = await TekrarStoreService.instance.tekrarCategory();
    productList = await TekrarStoreService.instance.tekrarCategoryView(widget.categoryDetail.id);
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
      appBar: AppBar(title: Text(widget.categoryDetail.name),),
      body: Column(
        children: [
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
    );
  }
}