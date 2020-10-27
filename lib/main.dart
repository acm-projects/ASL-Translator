import 'package:flutter/material.dart';

import './cameraPage.dart';
import './history.dart';
import './education.dart';

void main()
{
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
    CameraPage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "ASL-Translator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        //appBar: AppBar(title: Text('ASL Translator'),),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
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