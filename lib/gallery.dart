
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(

      ),
    );
  }
  
}

  /* List _outputs;
  File _image;
  Future<File> futureImage;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
      ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
      : Container(
        //width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? //block to add image
            Container() : 
             Image.file(_image,
             height: 300,),
            
            SizedBox(
              height: 20,
            ),
            _outputs != null ?
                Text(
             // "${_outputs[0]["label"]}",
              (_outputs.toString()),
            )
            : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int value = await pickImage();
          if(value == 1)
          {
            goToRecycle();
          }else{
            goToNotRecycle();
          }

        },
        child: Icon(Icons.image),
      ),
    );
  }
  void goToRecycle()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) 
      => Recycleable(image: _image
      , val: "hry")
      )
    );
  }
  void goToNotRecycle()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) 
      => NotRecycleable(image: _image
      , val: "hry")
      )
    );
  }
  Future<int> pickImage() async {
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
    if(output != null)
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
} */