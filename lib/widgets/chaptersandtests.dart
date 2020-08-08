import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Chapters extends StatefulWidget {
  final String chaptername;
  Chapters({Key key,this.chaptername}):super(key:key);
  @override
  _ChaptersState createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
        Container(
        width: MediaQuery.of(context).size.width*.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.grey[300],
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/logo/A1.png'),
                      ),
                    ],
                  ),
                  Container(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.chaptername,style: TextStyle(fontSize: 17,color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      Text("widget.chaptername",style: TextStyle(fontSize: 15,color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,15,0,10),
                        child: LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width*.71,
                          lineHeight: 5.0,
                          percent: 0.4,
                          progressColor: Colors.deepOrangeAccent,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("30 Videos | 10 E-books",style: TextStyle(fontSize: 15,color: Colors.grey,
                              fontWeight: FontWeight.w500)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.25,0,0,0),
                            child: Text("40%",style: TextStyle(fontSize: 15,color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}




class Tests extends StatefulWidget {
  final String chaptername;
  Tests({Key key,this.chaptername}):super(key:key);
  @override
  _TestsState createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.grey[300],
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/logo/A1.png'),
                          ),
                        ],
                      ),
                      Container(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,10,0,10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.chaptername,style: TextStyle(fontSize: 17,color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                  child: Text("3 Papers | 10 Questions",style: TextStyle(fontSize: 15,color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
