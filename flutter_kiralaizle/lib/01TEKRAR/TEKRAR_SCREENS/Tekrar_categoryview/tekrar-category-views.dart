import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-routes.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar-product.dart/tekrar-product.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-primarybutton.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-store.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';

class TekrarCategoryViews extends StatefulWidget {
  final CategoryModel catviews;
  const TekrarCategoryViews({super.key,required this.catviews});

  @override
  State<TekrarCategoryViews> createState() => _TekrarCategoryViewsState();
}

class _TekrarCategoryViewsState extends State<TekrarCategoryViews> {
  List<CategoryModel> tekrarCategory = [];
  List<ProductModel> tekrarProduct = [];
  bool isLoading = true;

  void tekrarDisplay() async {
    setState(() {
      isLoading = true;
    });
    tekrarCategory = await TekrarStore.instance.tekrarCategory();
    tekrarProduct = await TekrarStore.instance.tekrarCategoryView(widget.catviews.id);
    setState(() {
      isLoading = false;
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
      appBar: AppBar(title: Text(widget.catviews.name),),
      body: Column(
        children: [
            GridView.builder(
              shrinkWrap: true,
              primary: false,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30
                      ),
                      itemCount: tekrarProduct.length,
                itemBuilder: (context, index) {
                  ProductModel model = tekrarProduct[index];
                  return Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Image.network(model.image!,width: 160,height: 160,),
                        Text(model.name!),
                        Text("${model.price!}"),
                        TekrarPrimaryButton(title: "Buy",onPressed: (){
                          TekrarRoutes.instance.tekrarPush(widget: TekrarProductDetails(productModel: model), context: context);
                        },)
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