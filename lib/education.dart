import 'package:flutter/material.dart';
class LetterButton extends StatelessWidget
{
  var letter;
  LetterButton({
    Key key, this.letter
}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 7.0, bottom: 15.0),
      width: 10,
      height: 10,
      child: RaisedButton(
        onPressed: placeHolder,
        color: Colors.lightBlue,
        child: Text(
          letter,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          )
        )
    ),
    );
  }
  }
placeHolder(){}
class EducationPage extends StatelessWidget
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
}