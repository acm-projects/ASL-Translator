import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io' as Io;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:google_fonts/google_fonts.dart';

String label = 'NULL';
double detectedConf = -1;

final String pv_arn = 'arn:aws:rekognition:us-east-2:248442916419:project/asl_translator/version/asl_translator.2020-10-17T02.47.19/1602920841128';
final double conf = 20.0, maxResult = 35;

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  String msg = "";

  @override
  void initState() {
    super.initState();
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
    _controller.dispose();
    super.dispose();
  }

  type(String val){
    log("type");
    setState(() {
      if (val == null){
        msg = msg + "";
      }
      else{
        msg = msg + val;
      }
    });
  }
  space() {
    log("space msg = $msg");
    setState(() {
      msg = msg + " ";
    });
  }

  clear(){
    log("clear pressed");
    setState(() {
      msg = "";
    });
  }

  backspace(){
    log("back pressed msg = $msg" );
    setState(() {
      if(msg.length > 0) {
        int end = msg.length - 1;
        String _substring = msg.substring(0, end);
        msg = msg.substring(0, end);
      }
    });
  }

  CameraController getController(){
    return _controller;
  }
  Future<void> getInitializeControllerFuture(){
    return _initializeControllerFuture;
  }

  @override
  Widget build(BuildContext context) {
    return
    Stack(
      children: [
        Expanded(
            child: Scaffold(
              body: RotatedBox(quarterTurns: 3, child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    // Otherwise, display a loading indicator.
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                },
              ),),

              floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 15.0),
                          child: FloatingActionButton.extended(
                            onPressed: () => backspace(),
                            label: GestureDetector(
                                onLongPress: () => clear(),
                                child: Text("Delete",)
                            )
                          )
                      ),
                    ),
                    Expanded(
                      child:FloatingActionButton(
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

                            label = await getImageLabel(path);
                            type(label);
                          } catch (e) {
                            // If an error occurs, log the error to the console.
                            print(e);
                          }
                        },
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(right: 15.0),
                            child: FloatingActionButton.extended(
                                onPressed: () => space(),
                                label: Text("Space")
                            ))),
                  ] ),

              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.025,
          top: 40,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                color:Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(28))
            ),
            padding: EdgeInsets.all(10.0),
            child: Text('$msg',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
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
}

Future<String> getImageLabel(String imagePath) async{
  final originalFile = File(imagePath);
  Image orignalImage = Image.file(File(imagePath));

  List<int> imageBytes = await Io.File(imagePath).readAsBytes();
  final img.Image originalImage = img.decodeImage(imageBytes);
  img.Image rotatedImage = img.copyRotate(originalImage, 360);

  final List<int> bytes = img.encodeNamedImage(rotatedImage, imagePath);

  String base64Encode = base64.encode(bytes);
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

