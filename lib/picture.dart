import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:toss_menu/RecyclePage/notrecycleable.dart';
import 'package:toss_menu/RecyclePage/recycleable.dart';

class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  List _outputs;
  File _image;
  Future<File> futureImage;
  bool _loading = false;
  int height;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        extendBodyBehindAppBar: true,
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/menu.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              )
          ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              child: Text(
                'Keep or Yeet',
                textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 54.0, 
                 fontFamily: 'Raleway',
                 fontWeight: FontWeight.w900
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(10),
              ), 
            Container(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              child: Text(
                'Find out if objects are recyclable, one image at a time',
                textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 24.0, 
                 fontFamily: 'Raleway',
                 fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              ),
            Center(
              child: SizedBox(
                width: 290,
                height: 55,
                child:
                RaisedButton(
                  elevation: 17,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.teal)),
                  onPressed: () async {
                    int value = await pickImageCamera();
                    //getImageSize(_image);
                    if(value == 1)
                    {
                      goToRecycle();
                    }else{
                      goToNotRecycle();
                    }
                  },
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Take Picture",
                    style: TextStyle(fontSize: 29,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox( 
              height: 20,
            ),
            SizedBox(
              width: 290,
              height: 55,
              child:
            RaisedButton(
              elevation: 17,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.teal)),
                onPressed: () async {
                  int value = await pickImageGallery();
                  //getImageSize(_image);
                  if(value == 1)
                  {
                    goToRecycle();
                  }else{
                    goToNotRecycle();
                  }
                },
                color: Colors.indigo[500],
                textColor: Colors.white,
                child: Text("Upload From Gallery",
                  style: TextStyle(fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        )
        ),
      ),
    );
  }
  /* Future<void> getImageSize(File im) async {
    //File image = new File('image.png'); // Or any other way to get a File instance.
    var decodedImage = await decodeImageFromList(im.readAsBytesSync());
    print(decodedImage.width);
    print(decodedImage.height.toDouble());
    height = decodedImage.height;
  } */
  void goToRecycle()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) 
      => Recycleable(image: _image
      , val: "hey")
      )
    );
  }
  void goToNotRecycle()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) 
      => NotRecycleable(image: _image
      , val: height)
      )
    );
  }
  Future<int> pickImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) 
      return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    int wait = await classifyImage(image); //waits to returns int value
    return wait; //returns 1 or 0
  }
  Future<int> pickImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) 
      return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    int wait = await classifyImage(image); //waits to returns int value
    return wait; //returns 1 or 0
  }
  Future<int> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 128,
      imageStd: 128,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
    if(_outputs != null && _outputs.isNotEmpty)
    {
      if(_outputs[0]["label"].toString().contains("Rec"))
      {
        return 1;
      }
      else if(_outputs[0]["label"].toString().contains("Org"))
      {
        return 0;
      }
    }
      return -1;
  }
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/recycleModel.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
