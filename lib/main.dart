import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  theme: ThemeData(primarySwatch: Colors.purple),
  debugShowCheckedModeBanner: false,
  home: DicePage(),
));

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String imagePath = "images/dice1.png";

  void roll(){
    Dice dice = new Dice(6);
    int randomNumber = dice.rollDice();
    setState(() {
      switch(randomNumber) {
        case 1:
          {
            imagePath = "images/dice1.png";
            break;
          }
        case 2:
          {
            imagePath = "images/dice2.png";
            break;
          }
        case 3:
          {
            imagePath = "images/dice3.png";
            break;
          }
        case 4:
          {
            imagePath = "images/dice4.png";
            break;
          }
        case 5:
          {
            imagePath = "images/dice5.png";
            break;
          }
        case 6:
          {
            imagePath = "images/dice6.png";
            break;
          }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice'),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.asset(imagePath),),
            RaisedButton(onPressed: () {
              roll();
            },
              child: Text('Roll'),
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
class Dice{
  int sides;
  Dice(this.sides);
  int rollDice(){
    Random random = new Random();
    return random.nextInt(6-1);
  }

}
