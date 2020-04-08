import 'dart:async';

import 'package:first_toss/notrecycleable.dart';
import 'package:first_toss/recycleable.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main()
{
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  int _questionIndex = 0;
  // This widget is the root of your application.
  void answerQuestion() {
    print(_questionIndex);
  }

  File _image;
  Future getImage(bool isCamera) async {
    File imageone;
    if (isCamera) {
      imageone = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      imageone = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = imageone;
    });
  }

  String value;
  Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        //appBar: AppBar(
          //title: Text('Main Menu'),
         //backgroundColor: Colors.teal,
        //),
        //backgroundColor: Colors.orange,
        body: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
        )),
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

