import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/updatepage.dart';
import 'auth/login.dart';
import 'screens/viewpage.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "login": (context) => LoginPage(),
         "HomePage": (context) => HomePage(),
        "viewpage": (context) => ViewPage()
      //  "updatepage": (context) => UpdatePage('id')
      },
    );
  }
}

