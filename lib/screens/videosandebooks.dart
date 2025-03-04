import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/model/videoebookmodel.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:lingolab/widgets/activecoursewidgets.dart';
import 'package:provider/provider.dart';


class ChapterDetails extends StatefulWidget {
  final String chapname;
  final String vdoebocount;
  ChapterDetails({Key key,this.chapname,this.vdoebocount}):super(key:key);
  @override
  _ChapterDetailsState createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  Widget appBarTitle;
  String selectedoption="videos";
  Color chaplinecolor = Colors.redAccent;
  Color chapheadcolor = Colors.redAccent;
  Color testlinecolor = Colors.white;
  Color testheadcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    CourseNotifier videoebook = Provider.of<CourseNotifier>(context);

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
      body: SingleChildScrollView(
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
                          Text(widget.chapname,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white),),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(widget.vdoebocount,
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
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: BorderDirectional(bottom: BorderSide(color:chaplinecolor,width: 1.5))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedoption ="videos";
                            chaplinecolor = Colors.redAccent;
                            chapheadcolor = Colors.redAccent;
                            testlinecolor = Colors.white;
                            testheadcolor = Colors.black;
                          });
                        },
                        child: Text("Videos",style: TextStyle(fontSize: 15,color: chapheadcolor,
                            fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(bottom: BorderSide(color: testlinecolor,width: 1.5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedoption ="ebooks";
                            chaplinecolor = Colors.white;
                            chapheadcolor = Colors.black;
                            testlinecolor = Colors.redAccent;
                            testheadcolor = Colors.redAccent;
                          });
                        },
                        child: Text("E-books",style: TextStyle(fontSize: 15,color: testheadcolor,
                            fontWeight: FontWeight.w900)
                        )
                    ),
                  ),
                ),
              ],
            ),
            for(VideoEbook x in videoebook.veList)
              videosandebook(x.veId,x.videoName,x.videoUrl,x.videolength,x.ebookName,x.ebookUrl,x.ebookpages,x.ebooksize),
          ],
        ),
      ),
    );
  }
  Widget videosandebook(vdoid,videoname,vdourl,videolength,ebookname,ebookurl,ebookpages,ebooksize){
    if (selectedoption=="videos"){
      return Videos(vdoid:vdoid,vdoname: videoname,videolength: videolength,vdourl: vdourl);
    }
    else{
      return Ebook(ebookname: ebookname,ebookurl: ebookurl,ebookpages:ebookpages,ebooksize:ebooksize);
    }
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
