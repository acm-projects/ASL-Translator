import 'package:flutter/material.dart';




class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Click on a letter to start learning!';

    return MaterialApp(
      title: title,
      home: Scaffold(

        appBar: AppBar(
          title: Text(title),
        ),

        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,

          // Generate 100 widgets that display their index in the List.
          children: <Widget> [
            Center(
                child: Container(
                    width: 500,
                    height: 500,
                    child: RaisedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => Answer(letter: 'A'),
                      ),
                      child: Text('A',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white70,
                        ),),
                      color: Colors.blue,
                    )
                ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'B'),
                    ),
                    child: Text('B',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'C'),
                    ),
                    child: Text('C',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'D'),
                    ),
                    child: Text('D',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'E'),
                    ),
                    child: Text('E',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'F'),
                    ),
                    child: Text('F',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'G'),
                    ),
                    child: Text('G',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'H'),
                    ),
                    child: Text('H',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'I'),
                    ),
                    child: Text('I',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'J'),
                    ),
                    child: Text('J',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'K'),
                    ),
                    child: Text('K',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'L'),
                    ),
                    child: Text('L',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'M'),
                    ),
                    child: Text('M',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'N'),
                    ),
                    child: Text('N',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'O'),
                    ),
                    child: Text('O',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'P'),
                    ),
                    child: Text('P',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                    builder: (context) => Answer(letter: 'Q'),
                    ),
                    child: Text('Q',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'R'),
                    ),
                    child: Text('R',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'S'),
                    ),
                    child: Text('S',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'T'),
                    ),
                    child: Text('T',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'U'),
                    ),
                    child: Text('U',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'V'),
                    ),
                    child: Text('V',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'W'),
                    ),
                    child: Text('W',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'X'),
                    ),
                    child: Text('X',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),

            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'Y'),
                    ),
                    child: Text('Y',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),
            Center(
              child: Container(
                  width: 500,
                  height: 500,
                  child: RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => Answer(letter: 'Z'),
                    ),
                    child: Text('Z',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),),
                    color: Colors.blue,
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
class Answer extends StatelessWidget {
  var letter;
      Answer({
  Key key, this.letter
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage sign;
    switch(letter){
      case 'A':
        sign = new AssetImage('assets/letterA.png');
        break;
      case 'B':
        sign = new AssetImage('assets/letterB.png');
        break;
      case 'C':
        sign = new AssetImage('assets/letterC.png');
        break;
      case 'D':
        sign = new AssetImage('assets/letterD.png');
        break;
      case 'E':
        sign  = new AssetImage('assets/letterE.jpg');
        break;
      case 'F':
        sign = new AssetImage('assets/letterF.jpg');
        break;
      case 'G':
        sign  = new AssetImage('assets/letterG.jpg');
        break;
      case 'H':
        sign  = new AssetImage('assets/letterH.jpg');
        break;
      case 'I':
        sign = new AssetImage('assets/letterI.png');
        break;
      case 'J':
        sign  = new AssetImage('assets/letterJ.png');
        break;
      case 'K':
        sign = new AssetImage('assets/letterK.png');
        break;
      case 'L':
        sign = new AssetImage('assets/letterL.jpg');
        break;
      case 'M':
        sign = new AssetImage('assets/letterM.png');
        break;
      case 'N':
        sign  = new AssetImage('assets/letterN.png');
        break;
      case 'O':
        sign = new AssetImage('assets/letterO.png');
        break;
      case 'P':
        sign = new AssetImage('assets/letterP.png');
        break;
      case 'Q':
        sign = new AssetImage('assets/letterQ.jpg');
        break;
      case 'R':
        sign = new AssetImage('assets/letterR.jpg');
        break;
      case 'S':
        sign = new AssetImage('assets/letterS.png');
        break;
      case 'T':
        sign = new AssetImage('assets/letterT.png');
        break;
      case 'U':
        sign = new AssetImage('assets/letterU.png');
        break;
      case 'V':
        sign = new AssetImage('assets/letterV.png');
        break;
      case 'W':
        sign = new AssetImage('assets/letterW.png');
        break;
      case 'X':
        sign = new AssetImage('assets/letterX.png');
        break;
      case 'Y':
        sign = new AssetImage('assets/letterY.png');
        break;
      case 'Z':
        sign = new AssetImage('assets/letterZ.png');
        break;
    }

    return AlertDialog(
      content: new Image(
        image: sign
      ),

    );
  }
}

/*class EducationPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
      Container(
        margin : EdgeInsets.only(top:15.0),
        child: Text(
          "EDUCATION",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 50,
              color: Colors.white,
          ),
        ),
        color: Colors.lightBlue,
        width: 100,
        height: 100,
      ),



      Container(
        child: Text(
            "Choose a letter to start learning!!\n",
            textAlign: TextAlign.center,
        ),
      ),

        LetterButton(letter: 'A'),
        LetterButton(letter: 'B'),
        LetterButton(letter: 'C'),
        LetterButton(letter: 'D'),
        LetterButton(letter: 'E'),
        LetterButton(letter: 'F'),
        LetterButton(letter: 'H'),
        LetterButton(letter: 'I'),
        LetterButton(letter: 'J'),
        LetterButton(letter: 'K'),
        LetterButton(letter: 'L'),
        LetterButton(letter: 'M'),
        LetterButton(letter: 'N'),
        LetterButton(letter: 'O'),
        LetterButton(letter: 'P'),
        LetterButton(letter: 'Q'),
        LetterButton(letter: 'R'),
        LetterButton(letter: 'S'),
        LetterButton(letter: 'T'),
        LetterButton(letter: 'U'),
        LetterButton(letter: 'V'),
        LetterButton(letter: 'W'),
        LetterButton(letter: 'X'),
        LetterButton(letter: 'Y'),
        LetterButton(letter: 'Z'),
    ],
    );

  }
}*/