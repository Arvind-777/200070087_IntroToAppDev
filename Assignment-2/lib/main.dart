import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'questionBank.dart';

void main()=> runApp(MaterialApp(
  home: QuizApp(),
));

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List<int> scoreHistory = [];
  var index = 0;
  String? statement;
  var bgColor = Colors.black26;

  @override
  Widget build(BuildContext context) {
    if(statement == "GAME OVER"){
      int score = 0;
      for(int i=0;i<scoreHistory.length;i++){
        score+= scoreHistory[i];
      }
      return Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 300.0,
              ),
              Center(
                  child: Text("$statement",style: TextStyle(color: Colors.white, fontSize: 20))
              ),
              SizedBox(
                height: 100.0,
              ),
              Center(
                  child: Text("Your Score : $score",style: TextStyle(color: Colors.white, fontSize: 20))
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreHistory.map((score)=>scoreSymbol(score)).toList(),
              ),
              SizedBox(
                height: 175.0,
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    scoreHistory=[];
                    index=0;
                    statement=null;
                  });
                },
                child: Ink(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,30.0),
                    child: Text("Try Again",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),

      );
    }
    statement = questionBank[index].question;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,0,20.0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 580,
              child: Center(
                  child: Text("$statement",style: TextStyle(color: Colors.white, fontSize: 24),textAlign: TextAlign.center,)
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  if(questionBank[index].answer==true){
                    scoreHistory.add(1);
                  }
                  else{
                  scoreHistory.add(0);
                  }

                  if(index == questionBank.length - 1){
                    statement = "GAME OVER";
                  }
                  else{
                    index+=1;
                  }
                });
              },
              child: Ink(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,30.0),
                  child: Text("True",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            InkWell(
              onTap: (){
                setState(() {
                  if(questionBank[index].answer==false){
                    scoreHistory.add(1);
                  }
                  else{
                    scoreHistory.add(0);
                  }

                  if(index == questionBank.length - 1){
                    statement = "THE END";
                  }
                  else{
                    index+=1;
                  }
                });
              },
              child: Ink(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,30.0),
                  child: Text("False",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              children: scoreHistory.map((score)=>scoreSymbol(score)).toList(),
            )
          ],
        ),
      )
    );
  }
}

Widget scoreSymbol(score){
  if(score==1){return Icon(Icons.check, color: Colors.green);}
  else return Icon(Icons.close, color: Colors.red);
}