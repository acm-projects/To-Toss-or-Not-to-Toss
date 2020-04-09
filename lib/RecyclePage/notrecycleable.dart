import 'dart:async';
import 'dart:ui';

//import 'package:first_toss/question.dart';
import 'package:toss_menu/RecyclePage/notrecycleableHeader.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:toss_menu/mainmenu.dart';


class NotRecycleable extends StatefulWidget {

  final String val;
  final Future<File> image;
  NotRecycleable({Key key, @required this.image, this.val}): super(key: key);

  @override
  _NotRecycleableState createState() => _NotRecycleableState(image, val);
}
class _NotRecycleableState extends State<NotRecycleable> 
  with SingleTickerProviderStateMixin {

  String val;
  Future<File> image;
  _NotRecycleableState(this.image, this.val);

  //ScrollController _scrollViewController;
  //TabController _tabController;
//////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
         // title: Text('Not Recycleable'),
         // backgroundColor: Colors.teal,
        //),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: NotNetworkingPageHeader(
              minExtent: 270.0,
              maxExtent: 450.0,
              image: image,
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
          ],
        )
    );

  }

  Widget scrollView(){
    return Scaffold(
      body:
    CustomScrollView(
      slivers: <Widget>[
        /*SliverAppBar(
          //pinned: true,
          floating: false,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Basic Slivers'),
          ),
        ),*/
        SliverToBoxAdapter(
          child:
            Stack(
              children: <Widget>[
                Container(
                  child:
                  showImage(image),
                  //showImage(image),
                ),
                Positioned(
                  bottom: -170,
                  child:
                  ClipRRect(
                    borderRadius: 
                    BorderRadius.circular(30.0),
                    child: 
                    Container(
                      alignment: Alignment.topCenter,
                      width: 415,
                      height: 200,
                      color: Colors.white,
                    ),
                  )
                )
              ],
              overflow: Overflow.visible,
          )
        ),
        
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildListDelegate([
            ClipRRect(
              borderRadius: 
              BorderRadius.circular(15.0),
              child: Container(
                color: Colors.orange,
                )
            ),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ]),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8.0),
            child: Text('Grid Header', style: TextStyle(fontSize: 24)),
          ),
        ),

      ],
    )
    );
  }
  
  pickImageFrom(ImageSource source) {
    setState(() {
      image = ImagePicker.pickImage(source: source);
    });
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
