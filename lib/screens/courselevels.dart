import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:lingolab/widgets/levellists.dart';
import 'package:provider/provider.dart';
class Courselevels extends StatefulWidget {
  final String imglocation;
  const Courselevels ({Key key,this.imglocation}):super(key:key);
  @override
  _CourselevelsState createState() => _CourselevelsState();
}

class _CourselevelsState extends State<Courselevels> {
  @override
  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  Widget appBarTitle;
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.12:(appHeight<=775)?appHeight*.11: appHeight*.10;
    double boxappheight2=(appHeight<=700)?appHeight*.1:(appHeight<=775)?appHeight*.09: appHeight*.09;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: true,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
          title: appBarTitle,
          actions: <Widget>[
            searchIcon()
          ],
        ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/images/bgimage.jpg"),
                fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.09), BlendMode.dstATop),
            )

        ),
        child: Column(
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
                           Text(Provider.of<SelectionNotifier>(context,listen:false).courseName,
                             style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white)),
                           SizedBox(height: 10),
                           Row(
                            children: <Widget>[
                              Text("60 Chapters | ",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white)),
                              Text("35 Tests",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white)),
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
                            backgroundImage: NetworkImage(widget.imglocation),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(height:50),
            LevelList(level:"Beginer",leveldisc:"60 Chapters | 35 Tests",imgloc:"assets/logo/A1.png"),
            SizedBox(height:50),
            LevelList(level:"Intermediate",leveldisc:"60 Chapters | 35 Tests",imgloc:"assets/logo/B1.png"),
            SizedBox(height:50),
            LevelList(level:"Advance",leveldisc:"60 Chapters | 35 Tests",imgloc:"assets/logo/C1.png"),
          ],
        ),
      ),

    );
  }
  Widget searchIcon(){
    return Container(
      height: 10,
      width: 48,
      padding: EdgeInsets.fromLTRB(0,10,10,10),
      child: ClipOval(
        child: Material(
          color: Colors.grey[300], // button color
          child: InkWell(
            splashColor: Colors.grey[300], // inkwell color
            child: SizedBox(width: 56, height: 56, child: actionIcon),
            onTap: () {
              setState(() {
                if ( this.actionIcon.icon == Icons.search){
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    autofocus: true,
                    style: new TextStyle(
                      color: Colors.black54,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search,color: Colors.black54),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.black54)
                    ),
                  );}
                else {
                  this.actionIcon = new Icon(Icons.search,color: Colors.black54);
                  this.appBarTitle =null;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
