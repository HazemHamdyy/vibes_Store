import 'package:flutter/material.dart';
import 'package:vibes_store/screens/bottomNavBar/bottomNavBar.dart';
import 'package:vibes_store/model.dart';
import 'package:vibes_store/screens/bottomNavBar/homePage.dart';
import 'package:vibes_store/screens/welcome.dart';


void main() {
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}

