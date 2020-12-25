import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/model/chaptermodel.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:lingolab/widgets/activecoursewidgets.dart';
import 'package:provider/provider.dart';
import 'package:lingolab/api/videoebookapi.dart';


class ActiveCourse extends StatefulWidget {
  final String qstnTest;
  ActiveCourse({Key key,this.qstnTest}):super(key:key);
  @override
  _ActiveCourseState createState() => _ActiveCourseState();
}

class _ActiveCourseState extends State<ActiveCourse> {
  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  Widget appBarTitle;
  String selectedoption="chapters";
  Color chaplinecolor = Colors.redAccent;
  Color chapheadcolor = Colors.redAccent;
  Color testlinecolor = Colors.white;
  Color testheadcolor = Colors.black;
  @override
  Widget build(BuildContext context) {



    String level=Provider.of<CourseNotifier>(context,listen:false).courseLevel;
    String levelName=(level=="a")?"Beginer":(level=="b")?"Intermediate":"Advance";
    CourseNotifier chapter = Provider.of<CourseNotifier>(context);
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
                          Text(Provider.of<SelectionNotifier>(context,listen:false).courseName+"("+levelName+")",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white),),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(widget.qstnTest,
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white),),
//                              Text("35 Tests",
//                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white),),
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
                        backgroundImage: NetworkImage(Provider.of<SelectionNotifier>(context,listen:false).courseImg),
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
                            selectedoption ="chapters";
                            chaplinecolor = Colors.redAccent;
                            chapheadcolor = Colors.redAccent;
                            testlinecolor = Colors.white;
                            testheadcolor = Colors.black;
                          });
                        },
                        child: Text("Chapters",style: TextStyle(fontSize: 15,color: chapheadcolor,
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
                          selectedoption ="tests";
                          chaplinecolor = Colors.white;
                          chapheadcolor = Colors.black;
                          testlinecolor = Colors.redAccent;
                          testheadcolor = Colors.redAccent;
                        });
                      },
                        child: Text("Tests",style: TextStyle(fontSize: 15,color: testheadcolor,
                            fontWeight: FontWeight.w900)
                        )
                    ),
                  ),
                ),
              ],
            ),
            for(Chapter x in chapter.chapterList)

            chaptersandtest(x.chapterName,x.chapterId),

          ],
        ),
      ),
    );
  }
Widget chaptersandtest(chapname,chapid){
    if (selectedoption=="chapters"){

      Future<String> loadResult() async{
        Future<String> result=Future.delayed(Duration(milliseconds: 0),() async{
          await getVideoebookListfullFromFirestore(context);
          return "Success";
        });
        return result;
      }
      Future<String> fetchResult() async{
        String resultFetched=await loadResult();
        return "Done";
      }
      fetchResult();
    return Chapters(chaptername: chapname,chapterid:chapid);
    }
    else{
      return Tests(chaptername: "test",);
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
