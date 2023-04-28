import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/FirebaseServices/FireStoreService/firebase_store_service.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/screens/product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryProduct;
  const CategoryView({super.key, required this.categoryProduct});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productCategori = [];
  bool isLoading = true;

  void categoriesDisplay() async {
    setState(() {
      isLoading = true;
    });
    productCategori =
        await StoreService.instace.getCategoryView(widget.categoryProduct.id);
    productCategori.shuffle();
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(height: kToolbarHeight,),
                Row(
                  children: [
                    BackButton(),
                    Text(widget.categoryProduct.name)
                  ],
                ),
                    productCategori.isEmpty
                        ? Center(
                            child: Text("En İyi Filmler Boş"),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: productCategori.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 25,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: 0.6,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              ProductModel product = productCategori[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      product.image!,
                                      width: 200,
                                      height: 200,
                                    ),
                                    Text(
                                      product.name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Price: ${product.price}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 45,
                                      width: 140,
                                      child: OutlinedButton(
                                          onPressed: () {
                                            MainRoutes.instance.push(
                                                widget: ProductDetails(
                                                    productDetails: product),
                                                context: context);
                                          },
                                          child: Text("Kirala")),
                                    ),
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
