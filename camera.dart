import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget
{
  @override
    Widget build(BuildContext context)
    {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize : MainAxisSize.max,
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: [

            RaisedButton(
              child: Text("Backspace"),
              //onPressed: _changeText,
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
              //onPressed: changeText,
              color: Colors.grey,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //splashColor: Colors.red,
            )

          ],
        ),
      );


    }
    //changeText()
    //{

    //}
  }

