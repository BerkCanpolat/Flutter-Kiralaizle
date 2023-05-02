import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/TEKRAR_CONSTANTS/tekrar-theme.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Auth/Tekrar_Home/tekrar-home.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SCREENS/Tekrar_Auth/Tekrar_Welcome/Tekrar-welcome.dart';
import 'package:flutter_kiralaizle/01TEKRAR/TEKRAR_SERV%C4%B0CE/tekrar-auth.dart';
import 'package:flutter_kiralaizle/01TEKRAR/Tekrar_provider/tekrar-provider.dart';
import 'package:flutter_kiralaizle/FirebaseServices/AuthServices/firebase_auth_service.dart';
import 'package:flutter_kiralaizle/constants/theme.dart';
import 'package:flutter_kiralaizle/firebase_options.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/Custom_Appbar/custom_appbar.dart';
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
        theme: data,
        home: StreamBuilder(
          stream: TekrarAuth.instance.tekrarGetAuthChange,
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