import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:toss_menu/RecyclePage/recycleHeader.dart';
import 'package:flutter/material.dart';
import 'package:toss_menu/gallery.dart';
import 'dart:io';
import 'package:toss_menu/globals.dart' as globals;
import 'package:image_picker/image_picker.dart';
import 'package:toss_menu/mainmenu.dart';
//import 'package:toss_menu/mainmenu.dart';

class Recycleable extends StatefulWidget {

  final String val;
  //final Future<File> image;
  final File image;
  Recycleable({Key key, @required this.image, this.val}): super(key: key);

  @override
  _RecycleableState createState() => _RecycleableState(image, val);
}
class _RecycleableState extends State<Recycleable> 
  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    globals.count++;
    print(globals.count);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  }
  var facts = ['Every three months, Americans throw enough aluminum in the landfills to build our nation\'s entire commercial air fleet.',
  'Recycling cardboard only takes 75% of the energy needed to make new cardboard.', 
  'Americans throw away enough office paper each year to build a 12 foot high wall from Seattle to NY',
  'Recycling one ton of plastic bottles saves the equivalent energy usage of a two person household for one year.',
  'Recycling prevents waste from going into oceans - it is proven, when there is a strong recycling culture, there is less litter and less waste going into ocean',
  'Enough plastic is thrown away each year to circle the earth four times.',
  'Recycling plastic takes 88% less energy than making it from raw materials.'];
  var rand = new Random();
  
  String val;
  //Future<File>image;
  File image;
  _RecycleableState(this.image, this.val);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: NetworkingPageHeader(
              minExtent: 70.0,
              maxExtent: 450.0, //fix to fit
              image: image ,
            ),
          ),
            SliverFixedExtentList(
              itemExtent: 400,
              delegate: SliverChildListDelegate([
                //Container(color: Colors.white),
                 Container(
                   decoration: BoxDecoration(
                     gradient: LinearGradient(colors: [Colors.white, 
                     new Color.fromRGBO(132, 234, 130, 1.0)],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter)
                   ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    color: new Color.fromRGBO(132, 234, 130, 1.0),
                    elevation: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: const ListTile(
                            title: Text('Thank you for your contribution to the environment!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, 
                            fontSize: 33,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500, 
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 310,
                          height: 60,
                          child:
                        RaisedButton(
                          elevation: 15,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.teal)),
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) 
                              => MainMenu(),
                              )
                            );
                          },
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Text("Continue Scanning",
                            style: TextStyle(fontSize: 29,
                            fontFamily: 'Raleway',)),
                        ),
                        ),
                        SizedBox( 
                          height: 26,
                        ),
                        SizedBox(
                          width: 310,
                          height: 60,
                          child:
                        RaisedButton(
                          elevation: 15,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.teal)),
                          onPressed: () {
                            //print(randomFact.nextInt(7));
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) 
                              => Gallery(),
                              )
                            ); */
                          },
                          color: Colors.indigo,
                          textColor: Colors.white,
                          child: Text("You Gained 5 Points!",
                            style: TextStyle(fontSize: 28,
                            fontFamily: 'Raleway',)),
                        ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            SliverFixedExtentList(
              itemExtent: 300,
              delegate: SliverChildListDelegate([
                //Container(color: Colors.white),
                 Container(
                   decoration: BoxDecoration(
                     gradient: LinearGradient(colors: [Colors.white, 
                     new Color.fromRGBO(132, 234, 130, 1.0)],
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter)
                   ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding
                        (padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text( 
                          'Did you know?', 
                          style: TextStyle(fontSize: 32,
                          fontWeight: FontWeight.w900, 
                          fontFamily: 'Raleway Bold'),
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            facts[rng()], textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width/14,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        )
                      ]
                    )
                  )
                 )
              ])
            ),
          ]
        )
    );
  }
  /* pickImageFrom(ImageSource source) {
    setState(() {
      image = ImagePicker.pickImage(source: source);
    });
  } */
  int rng()
  {
    int randomFact = rand.nextInt(7);
    return randomFact;
  }
  Widget show(File imageF)
  {
    return Image.file( 
      File(imageF.readAsStringSync()),
      fit:BoxFit.fitWidth,
      
    );
  }
  Widget showImage(Future<File> imageF) {
    return FutureBuilder<File>(
      future: imageF,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            //width: BoxFit.contain,
            fit: BoxFit.fitWidth,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}
