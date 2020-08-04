import 'package:flutter/material.dart';
import 'package:lingolab/widgets/levellists.dart';
class Courselevels extends StatefulWidget {
  @override
  _CourselevelsState createState() => _CourselevelsState();
}

class _CourselevelsState extends State<Courselevels> {
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.12:(appHeight<=775)?appHeight*.11: appHeight*.10;
    double boxappheight2=(appHeight<=700)?appHeight*.1:(appHeight<=775)?appHeight*.09: appHeight*.09;
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 1,],
                colors: <Color>[
                  Colors.redAccent,
                  Colors.orange,
                ],
              ),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,130,0,10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text("Physics",
                           style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white),),
                         SizedBox(height: 10),
                         Row(
                          children: <Widget>[
                            Text("60 Chapters | ",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white),),
                            Text("35 Tests",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white),),
                          ],
                         )
                       ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0,0,10,10),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/logo/english.png"),
                        ),
                    ),
                  ),
                ],
              ),
          ),
          SizedBox(height:50),
          LevelList(level:"Beginer",leveldisc:"Beginer Level or A1",),
          SizedBox(height:50),
          LevelList(level:"Intermediate",leveldisc:"Intermediate Level or B1",),
          SizedBox(height:50),
          LevelList(level:"Advance",leveldisc:"Advance Level or C1",),
        ],
      ),

    );
  }
}
