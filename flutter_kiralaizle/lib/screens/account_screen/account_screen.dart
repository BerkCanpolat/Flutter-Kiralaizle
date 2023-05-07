import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/constants/routes.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/edit_page/edit_page.dart';
import 'package:flutter_kiralaizle/widgets/primaryButton.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider? appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  appProvider.getuserInformationProvider.image == null
                      ? Icon(
                          Icons.person,
                          size: 100,
                        )
                      : CircleAvatar(
                        maxRadius: 50,
                        child: Image.network(
                            appProvider.getuserInformationProvider.image!),
                      ),
                  Text(appProvider.getuserInformationProvider.name!),
                  SizedBox(
                    height: 5,
                  ),
                  Text(appProvider.getuserInformationProvider.email!),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: PrimaryButton(
                      title: "Profili Düzenle",
                      onPressed: () {
                        MainRoutes.instance.pushMain(widget: EditPage(), context: context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: const Text("Your Orders"),
                    leading: const Icon(Icons.shopify_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Favourite"),
                    leading: const Icon(Icons.favorite_border),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("About Us"),
                    leading: const Icon(Icons.info_outline),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Support"),
                    leading: const Icon(Icons.support_agent),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Change Password"),
                    leading: const Icon(Icons.change_circle),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    title: const Text("Logout"),
                    leading: const Icon(Icons.logout),
                  ),
                  const Text("Version 1.0.0")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
