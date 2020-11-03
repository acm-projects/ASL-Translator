import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CameraScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import './history.dart';
import './education.dart';

CameraDescription firstCamera;

Future<Null> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  firstCamera = cameras.first;

  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatefulWidget
{
  @override
    State<StatefulWidget> createState()
    {
      return MyAppState();
    }
}

class MyAppState extends State<MyApp>
{
  int _selectedPage = 0;
  final _pageOptions = [
    EducationPage(),
    TakePictureScreen(camera: firstCamera),
    HistoryPage(),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _selectedPage = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "ASL-Translator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            pageChanged(index);
          },
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          physics: BouncingScrollPhysics(),
          children: _pageOptions,
        ),
        /*_pageOptions[_selectedPage],*/
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
              pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb_outline),
                title: Text('Education')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text('Translate')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text('History')
            ),
          ],
        ),
      ),
    );
  }
}