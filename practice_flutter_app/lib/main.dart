import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:camera/camera.dart';
import 'CameraScreen.dart';

import 'dart:io' as Io;

final String pv_arn = 'arn:aws:rekognition:us-east-2:248442916419:project/asl_translator/version/asl_translator.2020-09-29T01.40.38/1601361639822';
final double conf = 50.0, maxResult = 1;

//List<CameraDescription> cameras;

Future<Null> main() async{
  // TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );

  //runApp(MyApp());
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
  String detectedLabel = "";
  double detectedConf = 0.0;

  void _detect() async {
    String img = "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";
    detection resp = await detectIt(img);
    setState(() {
      detectedConf = resp.getConf();
      detectedLabel = resp.getLabel();
    });
  }

  //makes request to API
   Future<detection> detectIt(String imgBytes) async {
    final http.Response resp = await http.post(
      "https://nuu3hmin2b.execute-api.us-east-2.amazonaws.com/v1/detect",
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
