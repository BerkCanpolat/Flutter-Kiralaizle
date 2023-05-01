import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/FirebaseServices/AuthServices/firebase_auth_service.dart';
import 'package:flutter_kiralaizle/constants/constants.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/aut_ui/welcome/welcome.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider? appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Screen",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  appProvider.getUserInformation.image == null ? Icon(
                    Icons.person,
                    size: 120,
                  ): Image.network(appProvider.getUserInformation.image!),
                  Text(appProvider.getUserInformation.name),
                  Text(appProvider.getUserInformation.email),
                  SizedBox(height: 12,),
                  ElevatedButton(onPressed: (){}, child: Text("Edit"),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: (){},
                    title: Text("Your Orders"),
                    leading: Icon(Icons.online_prediction_rounded),
                  ),
                  ListTile(
                    onTap: () async{
                      Future<bool> isLogout = AuthService.instance.signout();
                      if(await isLogout){
                        MainRoutes.instance.pushAndRemoveUntil(widget: Welcome(), context: context);
                        showMessage("Çıkış Yapıldı");
                      }else{
                        showMessage("Çıkış Yapılamadı!");
                      }
                    },
                    title: Text("Logout"),
                    leading: Icon(Icons.logout),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text("Favourite"),
                    leading: Icon(Icons.favorite_border),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text("About Us"),
                    leading: Icon(Icons.add_moderator_sharp),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text("Support"),
                    leading: Icon(Icons.support_agent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
