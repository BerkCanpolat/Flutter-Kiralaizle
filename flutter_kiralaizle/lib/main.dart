import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/FirebaseServices/AuthServices/firebase_auth_service.dart';
import 'package:flutter_kiralaizle/constants/theme.dart';
import 'package:flutter_kiralaizle/firebase_options.dart';
import 'package:flutter_kiralaizle/screens/aut_ui/welcome/welcome.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: projeTheme,
      home: StreamBuilder(
        stream: AuthService.instance.getAuthChange,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Home();
          }else{
            return Welcome();
          }
        },
      )
    );
  }
}