// @dart=2.9
import 'package:flutter/material.dart';
import 'package:tinder_card/Screens/favourite.dart';
import 'package:tinder_card/Screens/landing_page.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {
        '/favouriteScreen': (context) => Favourite(),
      },
    );
  }
}
