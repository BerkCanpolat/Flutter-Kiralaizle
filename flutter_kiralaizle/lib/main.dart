import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kiralaizle/Service/FirebaseAuth.dart';
import 'package:flutter_kiralaizle/constants/theme.dart';
import 'package:flutter_kiralaizle/firebase_options.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:flutter_kiralaizle/screens/auth/welcome/welcome.dart';
import 'package:flutter_kiralaizle/screens/bottom_navigation_screen/bottom_navigation.dart';
import 'package:flutter_kiralaizle/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() async {
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
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: AuthService.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomNavigationScreen();
            } else {
              return Welcome();
            }
          },
        ),
        theme: themeData,
      ),
    );
  }
}
