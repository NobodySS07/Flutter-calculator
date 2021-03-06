import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class calcbutton extends StatelessWidget{
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const calcbutton({
    Key key,
    this.text,
    this.fillColor,
    this.textColor=0xFFFFFFFF,
    this.textSize = 35,
    this.callback,
}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child : SizedBox(
          width: 70,
          height: 70,
          child: FlatButton(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(60),
                    ),
         onPressed: (){
           callback(text);
         },
         child: Text(
           text,
           style: GoogleFonts.rubik(
             textStyle: TextStyle(
               fontSize: textSize,
             ),
           ),
         ),
            color: fillColor !=null?Color(fillColor):null,
            textColor: Color(textColor),
          ),
       ),
     );


  }
}