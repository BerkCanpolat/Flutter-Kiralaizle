import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-routes.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar-product.dart/tekrar-product.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-primarybutton.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Widgets/tekrar-widgets.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_account/tekrar-account.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_categoryview/tekrar-category-views.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-store.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class TekrarHome extends StatefulWidget {
  const TekrarHome({super.key});

  @override
  State<TekrarHome> createState() => _TekrarHomeState();
}

class _TekrarHomeState extends State<TekrarHome> {
  List<CategoryModel> tekrarCategory = [];
  List<ProductModel> tekrarProduct = [];
  bool isLoading = true;

  void tekrarDisplay() async {
    setState(() {
      isLoading = true;
    });
    tekrarCategory = await TekrarStore.instance.tekrarCategory();
    tekrarProduct = await TekrarStore.instance.tekrarProduct();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tekrarDisplay();
    TekrarProvider provider = Provider.of<TekrarProvider>(context,listen: false);
    provider.tekrarinfoFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TekrarTopTitle(title: "E Commerce", subtitle: ""),
            TextFormField(
              decoration: InputDecoration(hintText: "Search.."),
            ),
            TekrarTopTitle(title: "Categories", subtitle: ""),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tekrarCategory
                    .map(
                      (e) => CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          TekrarRoutes.instance.tekrarPush(widget: TekrarCategoryViews(catviews: e), context: context);
                        },
                        child: Card(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.network(e.image),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
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
                ElevatedButton(onPressed: (){
                  TekrarRoutes.instance.tekrarPush(widget: TekrarAccount(), context: context);
                }, child: Text("Profil"))
          ],
        ),
      ),
    );
  }
}
