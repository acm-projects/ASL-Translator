import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:camera/camera.dart';

import 'dart:io' as Io;

//pv_arn is the amazon resource number used to id the AWS rekognition model that will get called
// conf and maxResult are configuration variables for the rekognition model
//conf dictates the minimum confidence of a detection to be returned
//maxresult dictates the number of returned results rekognition will provide (will output highest confidence detection)
final String pv_arn = 'arn:aws:rekognition:us-east-2:248442916419:project/asl_translator/version/asl_translator.2020-09-29T01.40.38/1601361639822';
final double conf = 50.0, maxResult = 1;

//List<CameraDescription> cameras;

Future<Null> main() async{
  //cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detection API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pet Detection Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//detection class to parse and store json response from rekognition
class detection {
  double confidence;
  String label;

  //constructor
  detection(Map<String, dynamic> json){
    this.confidence = json['CustomLabels'][0]['Confidence'];
    this.label = json['CustomLabels'][0]['Name'];
  }

  double getConf(){
    return this.confidence;
  }

  String getLabel(){
    return this.label;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //will be displayed in text widgets
  String detectedLabel = "";
  double detectedConf = 0.0;

  //calls detectIt and creates a new detection instance
  //then updates home screen state with new label  and confidence
  void _detect() async {
    //Base64 encoded image as a string
    //gets taken as an argument in request json to AWS
    String img = "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";

    detection resp = await detectIt(img); //calls detectIt to make api call to AWS and store response

    setState(() {
      detectedConf = resp.getConf();
      detectedLabel = resp.getLabel();
    });
  }

  //makes request to API, creates new detection instance from response
  //json and returns detection
  Future<detection> detectIt(String imgBytes) async {
    //the http request made by http.post
    //resp stores the json response of the post request
    final http.Response resp = await http.post(
      "https://mlmbih7wqi.execute-api.us-east-2.amazonaws.com/v1",
      headers: <String, String>{
        "Content-Type":"application/x-amz-json-1.1",
        "X-Amz-Target":"RekognitionService.DetectCustomLabels"
      },
      body: jsonEncode(<String, dynamic>{
        "Image": {"Bytes": imgBytes},
        "MaxResults": maxResult,
        "MinConfidence": conf,
        "ProjectVersionArn": pv_arn
      }),
    );
    //if request received a success status create new detection instance from resp body
    //else throw exception and provide debuggin information
    if (resp.statusCode == 200)
      {
        //print ("success");
        //print("\nResponse Body\n:::::\n"+resp.body+"\n:::::\n");
        detection result = new detection(json.decode(resp.body));
        return  result;
      }
    else
      {
        throw Exception('Failed. Status code: ' + resp.statusCode.toString() + "\nResponse Body: " + resp.body+"\n\n");
}
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Confidence: ' + detectedConf.toString(),
                style:TextStyle(fontSize: 18)),
            ),
            Text(
              'Object Detected: ' + detectedLabel,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _detect,
        tooltip: 'Detect a label',
        child: Icon(Icons.camera_alt),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
