import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-auth.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:provider/provider.dart';

class TekrarAccount extends StatefulWidget {
  const TekrarAccount({super.key});

  @override
  State<TekrarAccount> createState() => _TekrarAccountState();
}

class _TekrarAccountState extends State<TekrarAccount> {
  @override
  Widget build(BuildContext context) {
    TekrarProvider provider = Provider.of<TekrarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  provider.providerUserModel.image == null
                      ? Icon(Icons.person)
                      : Image.network(provider.providerUserModel.image!),
                  Text(provider.providerUserModel.name),
                  Text(provider.providerUserModel.email),
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
                    title: Text("Ayarlar"),
                  ),
                  ListTile(
                    title: Text("Ayarlar"),
                  ),
                  ListTile(
                    title: Text("Ayarlar"),
                  ),
                  ListTile(
                    title: Text("Ayarlar"),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        TekrarAuth.instance.tekrarCikis();
                      });
                    },
                    title: Text("Ayarlar"),
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
