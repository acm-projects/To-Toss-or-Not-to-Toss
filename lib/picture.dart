import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:toss_menu/RecyclePage/notrecycleable.dart';
import 'package:toss_menu/RecyclePage/recycleable.dart';

class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {

  
  String value;
  Future<File> imageFile;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/city.png'),
              fit: BoxFit.fitWidth,
              )
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*Text(
              'Find out if objects are recyclable, one image at a time',
              textAlign: TextAlign.center,
               style: TextStyle(fontSize: 24.0, 
               fontWeight: FontWeight.bold),
              
            ),*/
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              ),
            Center(
              child: SizedBox(
                width: 290,
                height: 55,
                child:
              RaisedButton(
                elevation: 15,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.teal)),
                onPressed: () {
                  pickImageFrom(ImageSource.camera);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) 
                  => NotRecycleable(image: imageFile
                  , val: value)),
                  );
                },
                color: Colors.teal,
                textColor: Colors.white,
                child: Text("Take Picture",
                  style: TextStyle(fontSize: 29)),
              ),
              ),
            ),
            SizedBox( 
              height: 25,
            ),
            SizedBox(
              width: 290,
              height: 55,
              child:
            RaisedButton(
              elevation: 15,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.teal)),
              onPressed: () {
                pickImageFrom(ImageSource.gallery);
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) 
                => Recycleable(image: imageFile
                , val: value)
                ),
                );
              },
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text("Upload From Gallery",
                style: TextStyle(fontSize: 25)),
            ),
            ),
          ],
        )
        ),
      ),
    );
  }

  pickImageFrom(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
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
