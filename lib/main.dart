import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelitineraryplanner/login.dart';
import 'package:travelitineraryplanner/register.dart';
import 'package:travelitineraryplanner/home.dart' as home;
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: 'login',
    debugShowCheckedModeBanner: false,
    routes: {
      'login': (context) => const MyLogin(),
      'register': (context) => const MyRegister(),
      'home': (context) => const home.MyHome(),
    },
  ));
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MaterialApp(
//     theme: ThemeData.dark(),
//     initialRoute: 'login',
//     debugShowCheckedModeBanner: false,
//     routes: {
//       'login': (context) => const MyLogin(),
//       'register': (context) => const MyRegister(),
//       'home': (context) => const MyHome(),
//     },
//   ));
// }
