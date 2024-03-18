import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/mainpage.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isAndroid){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCrLk-NMRaQgGH1GlYl0yxI5u4G-_NEjgY",
        appId: "1:245560806155:android:47831159404017c50a300e",
        messagingSenderId: "245560806155",
        projectId: "ta-air-purifier",
        storageBucket: "ta-air-purifier.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
      'mainpage': (context) => const mainpage(),
    },
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}
