import 'dart:io';
import 'package:toss_menu/globals.dart' as globals;
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
                  new Color.fromRGBO(216, 239, 255, 1.0)],
                  begin: Alignment.topCenter,
                  end: Alignment.lerp(Alignment.center, 
                  Alignment.bottomCenter, .5),
                )
               ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: RaisedButton(
            elevation: 10,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: new Color.fromRGBO(132, 234, 130, 1.0)),),
              color: new Color.fromRGBO(132, 234, 130, 1.0),
              onPressed: () {
              },
             padding: const EdgeInsets.all(8.0),
             child: Text('Recycle more objects to grow your forest!', 
                    style: TextStyle(fontSize: 30, fontFamily: 'Raleway'), 
                    textAlign: TextAlign.center),
           ),
         ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 120, 15, 0),
            child: 
            RaisedButton(
              elevation: 10,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.amber[400]),),
              color: Colors.amber[400],
              onPressed: () {
                setState(() {
                  globals.count--;
                });
              },
              padding: const EdgeInsets.all(8.0),
              child: Text('You currently have ' + 
              ((globals.count * 5).toString() + ' points!'), 
                style: TextStyle(fontSize: 30, fontFamily: 'Raleway'), 
                textAlign: TextAlign.center,),
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
    if(globals.count<= 1)
    return AssetImage( 
      'assets/forest11.png',
    );
    else if(globals.count == 2)
    return AssetImage( 
      'assets/forest22.png',
    );
    else 
    return AssetImage( 
      'assets/forest33.png',
    );
  }
}