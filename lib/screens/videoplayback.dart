import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/widgets/activecoursewidgets.dart';


class VideoPlayback extends StatefulWidget {
  @override
  _VideoPlaybackState createState() => _VideoPlaybackState();
}

class _VideoPlaybackState extends State<VideoPlayback> {
  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  Widget appBarTitle;
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.share,color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border,color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/video.jpg"),
                    fit: BoxFit.fill,
                  )
              ),
            ),


            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Related videos",style: TextStyle(fontSize: 15,color: Colors.black,
                      fontWeight: FontWeight.w900)),
                ),
              ],
            ),
            Videos(chaptername: "Introductionfsbgds",),
            Videos(chaptername: "Introductionfsbgds",),
            Videos(chaptername: "Introductionfsbgds",),
            Videos(chaptername: "Introductionfsbgds",),
            Videos(chaptername: "Introductionfsbgds",),
            Videos(chaptername: "Introductionfsbgds",),
            Videos(chaptername: "Introductionfsbgds",),
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
