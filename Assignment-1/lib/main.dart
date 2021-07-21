
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main()=>runApp(Calculator());

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var btnColor = Colors.blueGrey;
  var bordColor = Colors.red;
  var btnPadding=40.0;
  String expression="0";
  dynamic answer = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child:Container(
                          child: Text("$expression", textAlign: TextAlign.end, style: TextStyle(fontSize: 30 , color: Colors.white)),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                      )
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:Container(
                      child: Text("$answer", textAlign: TextAlign.end,style: TextStyle(fontSize: 30, color: Colors.white)),
                      padding: EdgeInsets.symmetric( vertical:btnPadding),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:bordColor
                        ),
                      )
                  )
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(expression.length<22)expression = expression + "1";
                        });
                      },
                      child: Ink(
                        child: Text("1", textAlign: TextAlign.center,),
                        padding: EdgeInsets.symmetric( vertical:btnPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:bordColor
                          ),
                          color: btnColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(expression.length<22)expression = expression + "2";
                        });
                      },
                      child: Ink(
                        child: Text("2", textAlign: TextAlign.center,),
                        padding: EdgeInsets.symmetric( vertical:btnPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:bordColor
                          ),
                          color: btnColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(expression.length<22)expression = expression + "3";
                        });
                      },
                      child: Ink(
                        child: Text("3", textAlign: TextAlign.center,),
                        padding: EdgeInsets.symmetric( vertical:btnPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:bordColor
                          ),
                          color: btnColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(expression.length<22)expression = expression + "/";
                        });
                      },
                      child: Ink(
                        child: Text("/", textAlign: TextAlign.center,),
                        padding: EdgeInsets.symmetric( vertical:btnPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:bordColor
                          ),
                          color: btnColor,
                        ),
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "4";
                          });
                        },
                        child: Ink(
                          child: Text("4", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "5";
                          });
                        },
                        child: Ink(
                          child: Text("5", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "6";
                          });
                        },
                        child: Ink(
                          child: Text("6", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "x";
                          });
                        },
                        child: Ink(
                          child: Text("x", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "7";
                          });
                        },
                        child: Ink(
                          child: Text("7", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "8";
                          });
                        },
                        child: Ink(
                          child: Text("8", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "9";
                          });
                        },
                        child: Ink(
                          child: Text("9", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "-";
                          });
                        },
                        child: Ink(
                          child: Text("-", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + ".";
                        });},
                        child: Ink(
                          child: Text(".", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "0";
                          });
                        },
                        child: Ink(
                          child: Text("0", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "00";
                          });
                        },
                        child: Ink(
                          child: Text("00", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(expression.length<22)expression = expression + "+";
                          });
                        },
                        child: Ink(
                          child: Text("+", textAlign: TextAlign.center,),
                          padding: EdgeInsets.symmetric( vertical:btnPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:bordColor
                            ),
                            color: btnColor,
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          expression = "0";
                          answer = 0;
                        });
                      },
                      child: Ink(
                        child: Text("CLEAR", textAlign: TextAlign.center,),
                        padding: EdgeInsets.symmetric( vertical:btnPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:bordColor
                          ),
                          color: btnColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          answer = process(expression);
                          expression = "0";
                        });
                      },
                      child: Ink(
                        child: Text("=", textAlign: TextAlign.center,),
                        padding: EdgeInsets.symmetric( vertical:btnPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:bordColor
                          ),
                          color: btnColor,
                        ),
                      ),
                    ),
                  ),
                ]
              )

            ],
          )
        ),
      )
    );
  }
}

dynamic process(String expression){
  List symbols = ['/','x','+','-'];
  int n = expression.length;

  if(symbols.contains(expression[n-1])){return "Wrong Syntax";}
  if(n==1){return expression;}

  List delimiters=['+','-'];
  List substringList=[];
  List symbolsOrder = [];
  int substringStart=0;
  for(int k=0;k<n;k++){
    if(delimiters.contains(expression[k])){symbolsOrder.add(expression[k]); substringList.add(expression.substring(substringStart,k)); substringStart=k+1;}
    else if(k==n-1){substringList.add(expression.substring(substringStart,n));}
  }
  List<dynamic> simplifiedNumbersList= (substringList.map((element) {return multDivider(element);})).toList();

  int z = simplifiedNumbersList.length;
  for(int i=0;i<z;i++){
    if(simplifiedNumbersList[i]=="Error"){return "Can't Divide By Zero";}
  }
  double sum = simplifiedNumbersList[0];
  for(int m=0;m<z-1;m++){
    if(symbolsOrder[m]=='+'){sum += simplifiedNumbersList[1+m];}
    else {sum -= simplifiedNumbersList[1+m];}
  }
  return sum;
}

dynamic multDivider(String expression){
  int l = expression.length;
  List delimiters=['x','/'];
  List<String> substringList = [];
  int substringStart=0;
  List symbolsOrder = [];
  for(int k=0;k<l;k++){
    if(delimiters.contains(expression[k])){symbolsOrder.add(expression[k]); substringList.add(expression.substring(substringStart,k)); substringStart=k+1;}
    else if(k==l-1){substringList.add(expression.substring(substringStart,l));}
  }
  List<double> splitNumbers = (substringList.map((element){return double.parse(element);})).toList();
  int n = splitNumbers.length;
  double numerator = splitNumbers[0];
  double denominator = 1;
  for(int j=0;j<n-1;j++){
    if(symbolsOrder[j]=='x'){numerator *= splitNumbers[1+j];}
    else{denominator *= splitNumbers[1+j];}
  }
  if(denominator==0){return "Error";}
  return numerator/denominator;
}