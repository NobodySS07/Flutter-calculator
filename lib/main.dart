import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyCalc());
}

class MyCalc extends StatefulWidget {
    const MyCalc({Key key}): super(key:key);
    @override
      CalcState createState() => CalcState ();
   }

class CalcState extends State<MyCalc> {

  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void _allClear() {
    setState(() {

      _expression = '';
    });
  }

  void clear() {
    setState(() {
      _expression =_expression.substring(0,_expression.length - 1);
    });
  }

  void evaluate() {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {

      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculator',
    home : Scaffold(
      backgroundColor: Colors.white12,
      body: Container(
        padding: EdgeInsets.all(10),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.end ,
          children: <Widget>[
         Container(
      child: Padding(
      padding: const EdgeInsets.all(12),
    child: Text(
    _expression,
    style: GoogleFonts.rubik(
    textStyle: TextStyle(
    fontSize: 48,
    color: Colors.white,
    ),
    ),
    ),
    ),
    alignment: Alignment(1.0,1.0),
    ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(onPressed: () => {_allClear() },
                  child:Text("AC"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ), FlatButton(onPressed: () => {clear() },
                  child:Text("<-"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),

                  FlatButton(onPressed: () => {numClick('%') },
                  child:Text("%"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                  ),

                    FlatButton(onPressed: () => {numClick('/') },
                    child:Text("/"),color: Colors.redAccent,
                    padding: EdgeInsets.all(5.0),
                    ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: () => {numClick('7') },
                  child:Text("7"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('8') },
                  child:Text("8"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('9') },
                  child:Text("9"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('*') },
                  child:Text("*"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: () => {numClick('4') },
                  child:Text("4"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('5') },
                  child:Text("5"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('6') },
                  child:Text("6"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('-') },
                  child:Text("-"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: () => {numClick('1') },
                  child:Text("1"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('2') },
                  child:Text("2"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('3') },
                  child:Text("3"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('+') },
                  child:Text("+"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: () => {numClick('.') },
                  child:Text("."),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('0') },
                  child:Text("0"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {numClick('00') },
                  child:Text("00"),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(onPressed: () => {evaluate() },
                  child:Text("="),color: Colors.redAccent,
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
  }
}





