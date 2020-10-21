
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(title: "RaisedButton", home: ButtonPush()));
class ButtonPush extends StatefulWidget {
  @override
  _ButtonPush createState() => _ButtonPush();
}
class _ButtonPush extends State {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize : MainAxisSize.max,
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,


            children: [

              RaisedButton(
                child: Text("Backspace"),
                onPressed: _changeText,
                color: Colors.grey,
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //splashColor: Colors.red,
              ),
             RawMaterialButton(
               onPressed: (){},
               elevation: 2.0,
               fillColor: Colors.blue,
               child: Icon(
                 Icons.camera_alt,
                 size:24,
                ),
               padding: EdgeInsets.all(20.0),
               shape: CircleBorder(),


             ),
              RaisedButton(
                child: Text("Space"),
                onPressed: _changeText,
                color: Colors.grey,
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //splashColor: Colors.red,
              )

            ],
          ),
        );


  }
  _changeText() {

  }
}


