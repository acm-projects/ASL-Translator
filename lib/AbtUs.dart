import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.lightBlue,
      indent: 60,
      endIndent: 60,
      thickness: 2,
      height: MediaQuery.of(context).size.height * .04,
    );
  }
}

class ProfileCard extends StatelessWidget{
  var name;
  var title;
  var image;

  ProfileCard({
    Key key, this.name, this.title, this.image
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container( //box of profile card
        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.33,
        decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.lightBlueAccent),
        borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Column( //column of profile pic, name, and title
          children: [
            Container( //image
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                fit: BoxFit.fill,
                image: image),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text( //name
                  "${name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              Container( //title
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  "${title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                  )
                ) ,
            ),
        ],
      )
    );
  }
}

class AbtUs extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    const images = [
      AssetImage('assets/placeholder2.png'),
      AssetImage('assets/placeholder2.png'),
      AssetImage('assets/placeholder2.png'),
      AssetImage('assets/placeholder2.png'),
      AssetImage('assets/placeholder2.png'),
      AssetImage('assets/placeholder2.png'),
      AssetImage('assets/placeholder2.png')
    ];

    var team = [
      "Kendra Huang",
      "Francis Masangcay",
      "Rigre Garciandia",
      "Jeshna Gupta",
      "Jaebaek Lee",
      "Rahul Patel",
      "David Ricaud"
    ];
    String front = "Front End Dev";
    String back = "Back End Dev";
    String full = "Full Stack Dev";
    var titles = ["Project Manager", full, full, front, back, front, "Advisor"];

    return ListView(
        padding: EdgeInsets.all(25.0),
        children: [
          Column(
              children: [Container(
                  margin: EdgeInsets.only(top: 35),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/placeholder2.png'),
                    ),
                  )
              ),
              ]
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Devoted to bridging the gap \nbetween ASL and the world\nHappy signing!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                )
            )
          ),
          Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                  "ABOUT THE TEAM",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                  )
              )
          ),
          ProfileCard(name: team[0], title: titles[0], image: images[0]),
          MyDivider(),
          ProfileCard(name: team[1], title: titles[1], image: images[1]),
          MyDivider(),
          ProfileCard(name: team[2], title: titles[2], image: images[2]),
          MyDivider(),
          ProfileCard(name: team[3], title: titles[3], image: images[3]),
          MyDivider(),
          ProfileCard(name: team[4], title: titles[4], image: images[4]),
          MyDivider(),
          ProfileCard(name: team[5], title: titles[5], image: images[5]),
          MyDivider(),
          ProfileCard(name: team[6], title: titles[6], image: images[6]),
        ]
     );
    }
  }