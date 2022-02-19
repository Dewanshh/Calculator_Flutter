import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  @override
  final String text;
  final int fillcolor;
  final int textcolor;
  final double textsize;
  final Function callback;
  const CalcButton(
      {required this.text,
      required this.fillcolor,
      required this.textsize,
      this.textcolor = 0xFFFFFFFF,
      required this.callback});
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(12),
      child: SizedBox(
        width: 70,
        height: 70,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
              fontSize: 50,
            )),
          ),
          color: fillcolor != null ? Color(fillcolor) : null,
          textColor: Color(textcolor),
        ),
      ),
    );
  }
}
