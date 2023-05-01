import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/FirebaseServices/AuthServices/firebase_auth_service.dart';
import 'package:flutter_kiralaizle/FirebaseServices/FireStoreService/firebase_store_service.dart';
import 'package:flutter_kiralaizle/constants/padding.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/models/category_model/category_model.dart';
import 'package:flutter_kiralaizle/models/product_model/product_model.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/category_view/category_view.dart';
import 'package:flutter_kiralaizle/screens/product_details/product_details.dart';
import 'package:flutter_kiralaizle/widgets/top_titles/top_titles.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ProductModel> productCategori = [];
  bool isLoading = true;

  void categoriesDisplay() async {
    setState(() {
      isLoading = true;
    });
    categories = await StoreService.instace.getCategori();
    productCategori = await StoreService.instace.getProductModel();
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
    AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
    appProvider.getUserInfoFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: GeneralPadding.instace.generalPadding.padding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopTitles(title: "Kirala İzle", subtitle: ""),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Ara.."),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Kategoriler",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    categories.isEmpty
                        ? Center(
                            child: Text("Kategori Boş"),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categories
                                  .map((e) => Padding(
                                        padding:
                                            EdgeInsets.only(left: 6, right: 6),
                                        child: CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            MainRoutes.instance.push(widget: CategoryView(categoryProduct: e), context: context);
                                          },
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              child: Image.network(e.image),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: GeneralPadding.instace.generalPadding.padding,
                      child: Text(
                        "En İyi Filmler",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    productCategori.isEmpty
                        ? Center(
                            child: Text("En İyi Filmler Boş"),
                          )
                        : GridView.builder(
                          padding: EdgeInsets.only(bottom: 80),
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
              ));
  }
}
