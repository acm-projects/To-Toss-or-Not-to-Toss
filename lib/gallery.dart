

import 'dart:io';

import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  File image1 = File('assets/forest1.png');
  File image2 = File('assets/forest2.png');
  File image3 = File('assets/forest3.png');
  
  int count = 3; 

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6))
        ..repeat(reverse: true);

    offset = Tween<Offset>(begin: Offset(-0.45,0), end: Offset(0.43, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: new Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, 
                  new Color.fromRGBO(255, 252, 243, 1.0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
               ),
            ),
          ),
          Positioned(
            child: 
            OverflowBox(
              alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: offset,
                    child: new OverflowBox(
                    alignment: Alignment.bottomCenter,
                    minWidth: 0.0, 
                    minHeight: 150.0, 
                    maxWidth: 800.0,
                    child: new Image(
                      image: show(),
                      //image: new AssetImage('assets/forest1.png'), 
                      fit: BoxFit.cover,) 
                    ),
                  ), 
              ),
          ),
        ],
      ),
    )
    );
  }
  
  AssetImage show()
  {
    if(count <= 1)
    return AssetImage( 
      'assets/forest1.png',
    );
    else if(count == 2)
    return AssetImage( 
      'assets/forest2.png',
    );
    else 
    return AssetImage( 
      'assets/forest3.png',
    );
  }
}