import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelList extends StatefulWidget {
  final String level;
  final String leveldisc;
  final String imgloc;
  const LevelList ({Key key,this.level,this.leveldisc,this.imgloc}):super(key:key);
  @override
  _LevelListState createState() => _LevelListState();
}

class _LevelListState extends State<LevelList> {
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.12:(appHeight<=775)?appHeight*.11: appHeight*.10;
    double boxappheight2=(appHeight<=700)?appHeight*.1:(appHeight<=775)?appHeight*.09: appHeight*.09;
    return Container(
      width: appWidth*.92,
      height: boxappheight2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 1,
            color: Colors.grey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(widget.imgloc),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.level,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),),
              Text(widget.leveldisc,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.grey),),
            ],
          ),
          Container(
              child: Icon(Icons.keyboard_arrow_right)
          ),
        ],
      ),
    );
  }
}
