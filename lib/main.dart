import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toss_menu/mainmenu.dart';
//import 'backGround.dart';


void main() => runApp(StartApp());



class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Side Bar App",
      home: MainMenu(),
    );
  }
}