import 'package:flutter/material.dart';
import './CameraScreen.dart';

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io' as Io;
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

String label = 'NULL';
double detectedConf = -1;
const String pv_arn = 'arn:aws:rekognition:us-east-2:248442916419:project/asl_translator/version/asl_translator.2020-10-17T02.47.19/1602920841128';
const double conf = 20.0, maxResult = 35;

/*class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}*/

class CameraPage extends StatelessWidget {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  //final cameras = await availableCameras();
  //final CameraDescription camera = cameras.first;

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // //   DeviceOrientation.portraitDown,
    // //   DeviceOrientation.landscapeLeft,
    // ]);
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.

    // SystemChrome.setPreferredOrientations([
    // //   DeviceOrientation.landscapeRight,
    // //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    // //   DeviceOrientation.portraitDown,
    // ]);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
          children: [
           RotatedBox(quarterTurns: 3, child: FutureBuilder<void>
              (
              future: _initializeControllerFuture,
              builder: (context, snapshot)
              {
                if (snapshot.connectionState == ConnectionState.done)
                {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                }
                else
                {
                  // Otherwise, display a loading indicator.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            ),
            FloatingActionButton(
              child: Icon(Icons.camera_alt),
              // Provide an onPressed callback.
              onPressed: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Construct the path where the image should be saved using the
                  // pattern package.
                  final path = join(
                    // Store the picture in the temp directory.
                    // Find the temp directory using the `path_provider` plugin.
                    (await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png',
                  );

                  // Attempt to take a picture and log where it's been saved.
                  await _controller.takePicture(path);

                  // If the picture was taken, display it on a new screen.
                  label = await getImageLabel(path);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(imagePath: path),
                    ),
                  );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  print(e);
                }
              },
            ),

            Row(
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
                /*RawMaterialButton(
                  onPressed: (){},
                  elevation: 2.0,
                  fillColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    size:24,
                  ),
                  padding: EdgeInsets.all(20.0),
                  shape: CircleBorder(),


                ),*/
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
          ],
      ),
      );
  }
}

//makes request to API
Future<detection> detectIt(String imgBytes) async {
  final http.Response resp = await http.post(
    "https://mlmbih7wqi.execute-api.us-east-2.amazonaws.com/v1/",
    headers: <String, String>{
      "Content-Type": "application/x-amz-json-1.1",
      "X-Amz-Target": "RekognitionService.DetectCustomLabels"
    },
    body: jsonEncode(<String, dynamic>{
      "Image": {"Bytes": imgBytes},
      "MaxResults": 35,
      "MinConfidence": 0,
      "ProjectVersionArn": pv_arn
    }),
  );

  if (resp.statusCode == 200)
  {
    print ("success");
    print("\nResponse Body\n:::::\n"+resp.body+"\n:::::\n");
    detection result = new detection(json.decode(resp.body));
    return  result;
  }
  else
  {
    throw Exception('Failed. Status code: ' + resp.statusCode.toString() + "\nResponse Body: " + resp.body+"\n\n");

  }

  // detection result = new detection.test();
  // return result;

}

Future<String> getImageLabel(String imagePath) async{
  // log(imagePath);
  // Image img = Image.file(File(imagePath));
  final bytes = await Io.File(imagePath).readAsBytes();
  // String base64Encode(List<int> bytes) => base64.encode(bytes)
  String base64Encode = base64.encode(bytes);
  //log(base64Encode);
  detection resp = await detectIt(base64Encode);
  String detectedLabel = resp.getLabel();
  log(detectedLabel);
  return detectedLabel;
}
class detection {
  double confidence;
  String label;
  String allLabels = "";

  //constructor
  detection(Map<String, dynamic> json){
    this.confidence = json['CustomLabels'][0]['Confidence'];
    this.label = json['CustomLabels'][0]['Name'];
    log(json['CustomLabels'].length.toString());

    for(int i = 0; i < json['CustomLabels'].length; i++){
      allLabels += "Name: " + json['CustomLabels'][i]['Name'] + "\n";
      allLabels += "Confidence: " + json['CustomLabels'][i]['Confidence'].toString() + "\n" + "\n";
    }

    log(allLabels);
  }

  detection.test(){
    confidence = 0;
    label = "test_label";
  }

  double getConf(){
    return this.confidence;
  }

  String getLabel(){
    return this.label;
  }

  String getAllLabels(){
    return allLabels;
  }
}


