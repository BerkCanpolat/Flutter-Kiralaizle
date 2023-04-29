import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_CONSTANTS/tekrar_theme.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_Provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_home/tekrar_home.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_screens/TEKRAR_welcome/tekrar_welcome.dart';
import 'package:flutter_kiralaizle/1TEKRAR/TEKRAR_service/TEKRAR_auth/tekrar_auth.dart';
import 'package:flutter_kiralaizle/FirebaseServices/AuthServices/firebase_auth_service.dart';
import 'package:flutter_kiralaizle/constants/theme.dart';
import 'package:flutter_kiralaizle/firebase_options.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/aut_ui/welcome/welcome.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TekrarProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: StreamBuilder(
          stream: TekrarService.instance.tekrarAuthChange,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return TekrarHome();
            }else{
              return TekrarWelcome();
            }
          },
        )
      ),
    );
  }
}