import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross=true;
  String messages;
  List<String> gameState;
  String currentPlayer;


  //init the state 
  @override
  void initState() {
    super.initState();
    this.messages = "";
    this.currentPlayer = "Cross";
    this.gameState=[
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
    ];
  }

  //playGame method
  playGame(int index){
    if (this.gameState[index] == 'empty' ) {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
          this.currentPlayer = "Circle";
        }else{
          this.gameState[index] = "circle";
          this.currentPlayer = "Cross";
        }
        this.isCross = !this.isCross;
        this.checkWin();
        
        
      });     
    } else {
    }
  }

  //Reset game ligic
  resetGame(){
    setState(() {
      this.gameState=[
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      'empty',
      ];
      this.messages = "";
      
    });
  }

  //get images
  //AssetImage 
  getImage(String value){
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;  
    }
  } 

  //check for win logic
  checkWin(){
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.messages= '${this.gameState[0]} Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.messages= '${this.gameState[3]} Wins';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.messages= '${this.gameState[6]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.messages= '${this.gameState[0]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.messages= '${this.gameState[2]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.messages= '${this.gameState[0]} Wins';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.messages= '${this.gameState[1]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.messages= '${this.gameState[2]} Wins';
      });
    } else if( !gameState.contains('empty')){
    this.messages= "Game Draw";
    }

    if (this.messages == "circle Wins") {
      this.gameState=[
      'circle',
      'circle',
      'circle',
      'circle',
      'circle',
      'circle',
      'circle',
      'circle',
      'circle',
      ];
      Timer(Duration(seconds: 3), (){
          this.resetGame();
        });
    }
    else if (this.messages == "cross Wins") {
      this.gameState=[
      'cross',
      'cross',
      'cross',
      'cross',
      'cross',
      'cross',
      'cross',
      'cross',
      'cross',
      ];
      Timer(Duration(seconds: 3), (){
          this.resetGame();
        });
    }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,                 
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context , i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: (){
                    playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            )
          ),

          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("${this.currentPlayer} Turn",
              style: TextStyle(
              color: Colors.orange,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
              ), 
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.messages,
              style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              ), 
            ),
          ),
          MaterialButton(
            color: Colors.deepOrange,
            minWidth: 200.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0) 
            ),
            height: 50.0,
            child: Text("Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: (){
              this.resetGame();
            }
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
            child: Text("LearnCodeOnline.in",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text("A Project By PULKITSONI",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

}