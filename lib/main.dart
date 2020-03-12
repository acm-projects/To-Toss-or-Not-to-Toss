import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import './question.dart';
import './Answer.dart';

void main() => runApp(MyApp());

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

  @override
  Widget build(BuildContext context) {
    var questions = ['Press Action', 'Continue Action'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Menu'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Question(questions[_questionIndex]),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.teal,
              child: Text('Take Picture'),
              onPressed: () {
                getImage(true);
              },
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Upload from Gallery'),
              onPressed: () {
                getImage(false);
              },
            ),
            _image == null
                ? Container(
                )
                : Image.file(
                    _image,
                    height: 400.0,
                    width: 500.0,
                  ),
          ],
        )),
      ),
    );
  }
}
