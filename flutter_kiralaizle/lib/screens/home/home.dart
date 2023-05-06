import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/Service/FirebaseStore.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/model/categoryModel.dart';
import 'package:flutter_kiralaizle/model/productModel.dart';
import 'package:flutter_kiralaizle/screens/categories%20view/categori_view.dart';
import 'package:flutter_kiralaizle/screens/productDetails/product_details.dart';
import 'package:flutter_kiralaizle/widgets/kiralaizletitle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ProductModel> product = [];
  bool isLoading = true;

  void categoriesDisplay() async{
    setState(() {
      isLoading = true;
    });
    categories = await StoreService.instance.categoryModel();
    product = await StoreService.instance.productModel();
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
      body:isLoading ? Center(child: CircularProgressIndicator(color: Colors.black,),) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              KiralaizleTitle(title: "Kiralaİzle", subtitle: ""),
              TextFormField(decoration: InputDecoration(hintText: "Ara.."),),
              KiralaizleTitle(title: "Kategoriler", subtitle: ""),
                ],
              ),
            ),
            categories.isEmpty ? Text("Kategori Boş") : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((e) => 
                Padding(
                  padding: const EdgeInsets.only(left: 6,right: 6),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      MainRoutes.instance.pushMain(widget: CategoriView(categoriViews: e), context: context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3.0,
                      color: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(e.image),
                      ),
                    ),
                  ),
                ),
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: KiralaizleTitle(title: "En Çok İzlenenler", subtitle: ""),
            ),
            product.isEmpty ? Text("En Çok İzlenenler Boş") : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: product.length,
                gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                  ), 
              itemBuilder: (context, index) {
                ProductModel productDisplay = product[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(child: Image.network(productDisplay.image!,width: 150,height: 150,)),
                      SizedBox(height: 5,),
                      Text(productDisplay.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),),
                      SizedBox(height: 5,),
                      Text("Fiyat: ${productDisplay.price}",style: TextStyle(fontSize: 13,color: Colors.white),),
                      SizedBox(height: 15,),
                      SizedBox(
                        width: 130,
                        child: OutlinedButton(
                          onPressed: (){
                            MainRoutes.instance.pushMain(widget: ProductDetails(productDetails: productDisplay), context: context);
                          }, 
                          child: Text("Kirala",style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ],
                  ),
                );
              },
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}