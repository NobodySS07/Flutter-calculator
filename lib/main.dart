import 'package:flutter/material.dart';
import 'package:mycalc2/widgets/calcbutton.dart';
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
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
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
            padding: const EdgeInsets.only(right: 12),
        child: Text(
          _history,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 24,
              color: Color(0xFF545F61),
            ),
          ),
        ),
      ),
      alignment: Alignment(1.0, 1.0),
    ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                  text: 'AC',
                  fillColor: 0xFF40C4FF,
                  textSize: 25,
                  callback: allClear,
                ),
                calcbutton(
                  text: 'C',
                  fillColor:  0xFF40C4FF,
                  textSize: 35,
                  callback: clear,
                ),
                calcbutton(
                  text: '%',
                  fillColor: 0xFFFBE9E7,
                  textColor: 0xFFFF1744,
                  callback: numClick,
                ),
                calcbutton(
                  text: '/',
                  fillColor: 0xFFFBE9E7,
                  textColor: 0xFFFF1744,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                  text: '7',
                  callback: numClick,
                ),
                calcbutton(
                  text: '8',
                  callback: numClick,
                ),
                calcbutton(
                  text: '9',
                  callback: numClick,
                ),
                calcbutton(
                  text: '*',
                  fillColor: 0xFFFBE9E7,
                  textColor: 0xFFFF1744,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                  text: '4',
                  callback: numClick,
                ),
                calcbutton(
                  text: '5',
                  callback: numClick,
                ),
                calcbutton(
                  text: '6',
                  callback: numClick,
                ),
                calcbutton(
                  text: '-',
                  fillColor: 0xFFFBE9E7,
                  textColor: 0xFFFF1744,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                  text: '1',
                  callback: numClick,
                ),
                calcbutton(
                  text: '2',
                  callback: numClick,
                ),
                calcbutton(
                  text: '3',
                  callback: numClick,
                ),
                calcbutton(
                  text: '+',
                  fillColor: 0xFFFBE9E7,
                  textColor: 0xFFFF1744,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(
                  text: '.',
                  callback: numClick,
                ),
                calcbutton(
                  text: '0',
                  callback: numClick,
                ),
                calcbutton(
                  text: '00',
                  callback: numClick,
                  textSize: 26,
                ),
                calcbutton(
                  text: '=',
                  fillColor: 0xFF40C4FF,
                  textSize: 25,
                  callback: evaluate,
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





