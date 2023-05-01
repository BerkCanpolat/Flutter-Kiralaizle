import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_Auth/welcome/tekrar_welcome.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_Screens/Tekrar_home/tekrar_home.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_constants/tekrar_theme.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_provider/tekrar_provider.dart';
import 'package:flutter_kiralaizle/ZTekrar/Tekrar_service/tekrar_auth.dart';
import 'package:flutter_kiralaizle/firebase_options.dart';
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
        home: StreamBuilder(
          stream: TekrarAuthService.instance.tekrarAuthChanges,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return TekrarHome();
            }else{
              return TekrarWelcome();
            }
          },
        ),
        theme: tekrarTheme,
      ),
    );
  }
}