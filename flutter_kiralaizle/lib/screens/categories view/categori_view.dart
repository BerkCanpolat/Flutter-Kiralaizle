import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/Service/FirebaseStore.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/model/categoryModel.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/screens/productDetails/product_details.dart';

class CategoriView extends StatefulWidget {
  final CategoryModel categoriViews;
  const CategoriView({super.key, required this.categoriViews});

  @override
  State<CategoriView> createState() => _CategoriViewState();
}

class _CategoriViewState extends State<CategoriView> {
  List<CategoryModel> categories = [];
  List<ProductModel> product = [];
  bool isLoading = true;

  void categoriesDisplay() async {
    setState(() {
      isLoading = true;
    });
    categories = await StoreService.instance.categoryModel();
    product =
        await StoreService.instance.categoriesView(widget.categoriViews.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoriViews.name,style: TextStyle(color: Colors.black),),),
      body: Column(
        children: [ isLoading ? Center(child: CircularProgressIndicator(color: Colors.black,),) :
          product.isEmpty
              ? Text("En Çok İzlenenler Boş")
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      ProductModel productDisplay = product[index];
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                                child: Image.network(
                              productDisplay.image!,
                              width: 150,
                              height: 150,
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              productDisplay.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Fiyat: ${productDisplay.price}",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 130,
                              child: OutlinedButton(
                                onPressed: () {
                                  MainRoutes.instance.pushMain(
                                      widget: ProductDetails(
                                          productDetails: productDisplay),
                                      context: context);
                                },
                                child: Text(
                                  "Kirala",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
