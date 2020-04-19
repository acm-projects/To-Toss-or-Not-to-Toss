import 'dart:async';
import 'dart:ui';
import 'package:toss_menu/RecyclePage/notrecycleableHeader.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:toss_menu/mainmenu.dart';


class NotRecycleable extends StatefulWidget {

  final int val;
  //final Future<File> image;
  final File image;
  NotRecycleable({Key key, @required this.image, this.val}): super(key: key);

  @override
  _NotRecycleableState createState() => _NotRecycleableState(image, val);
}
class _NotRecycleableState extends State<NotRecycleable> 
  with SingleTickerProviderStateMixin {

  int val;
  File image;
  //Future<File> image;
  _NotRecycleableState(this.image, this.val);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: NotNetworkingPageHeader(
              minExtent: 0,
              maxExtent: 400.0,
              imageF: image,
            ),
          ),
            SliverFixedExtentList(
              itemExtent: 400,
              delegate: SliverChildListDelegate([
                //Container(color: Colors.white),
                 Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    color: new Color.fromRGBO(250, 122, 113, 1.0),
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: const ListTile(
                            title: Text('This object is not recycleable, please try again.',
                            style: TextStyle(color: Colors.black, 
                            fontSize: 38.0, fontWeight: FontWeight.bold)),
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
                          onPressed: () {
                            //getImageSize(image);
                          },
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
          ],
        )
    );
  }
  
  /* pickImageFrom(ImageSource source) {
    setState(() {
      image = ImagePicker.pickImage(source: source);
    });
  } */
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
