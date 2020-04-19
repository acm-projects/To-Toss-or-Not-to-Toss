import 'dart:async';
import 'dart:ui';
import 'package:toss_menu/RecyclePage/recycleHeader.dart';
import 'package:flutter/material.dart';
import 'dart:io';
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

  String val;
  //Future<File>image;
  File image;
  _RecycleableState(this.image, this.val);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            fontSize: 38.0, fontWeight: FontWeight.w500, 
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
                            style: TextStyle(fontSize: 29)),
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
                          onPressed: () {},
                          color: Colors.indigo,
                          textColor: Colors.white,
                          child: Text("You Gained 5 Points!",
                            style: TextStyle(fontSize: 29)),
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
