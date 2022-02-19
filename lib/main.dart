import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = ' ';
  String _expression = ' ';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allclear(String text) {
    setState(() {
      _expression = '';
      _history = ' ';
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
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        _history,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(fontSize: 24),
                            color: Color(0xFF545F61)),
                      ),
                      alignment: Alignment(1, 1),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        _expression,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(fontSize: 48),
                            color: Colors.white),
                      ),
                      alignment: Alignment(1, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            text: 'AC',
                            callback: allclear,
                            fillcolor: 0xFF6C808F,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: 'C',
                            fillcolor: 0xFF6C808F,
                            callback: clear,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '%',
                            fillcolor: 0xFFFFFFFF,
                            callback: numClick,
                            textcolor: 0xFF000000,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '/',
                            fillcolor: 0xFFFFFFFF,
                            callback: numClick,
                            textcolor: 0xFF000000,
                            textsize: 25,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            text: '7',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '8',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '9',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '*',
                            fillcolor: 0xFFFFFFFF,
                            callback: numClick,
                            textcolor: 0xFF000000,
                            textsize: 25,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            text: '4',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '5',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '6',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '-',
                            callback: numClick,
                            fillcolor: 0xFFFFFFFF,
                            textcolor: 0xFF000000,
                            textsize: 25,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            text: '1',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '2',
                            fillcolor: 0xFF283637,
                            textcolor: 0xFFFFFFFF,
                            callback: numClick,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '3',
                            fillcolor: 0xFF283637,
                            textcolor: 0xFFFFFFFF,
                            callback: numClick,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '+',
                            fillcolor: 0xFFFFFFFF,
                            textcolor: 0xFF000000,
                            callback: numClick,
                            textsize: 25,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            text: '.',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '0',
                            callback: numClick,
                            fillcolor: 0xFF283637,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '00',
                            fillcolor: 0xFF283637,
                            callback: numClick,
                            textcolor: 0xFFFFFFFF,
                            textsize: 25,
                          ),
                          CalcButton(
                            text: '=',
                            fillcolor: 0xFFFFFFFF,
                            textcolor: 0xFF000000,
                            callback: evaluate,
                            textsize: 25,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
