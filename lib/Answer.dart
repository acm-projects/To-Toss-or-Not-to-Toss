import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectedFunc;
  final String buttonName;
  
  Answer(this.selectedFunc, this.buttonName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(buttonName),
        onPressed: selectedFunc,
      ),
    );
  }
}
