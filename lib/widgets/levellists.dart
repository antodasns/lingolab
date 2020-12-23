import 'package:flutter/material.dart';
import 'package:lingolab/api/paymentapi.dart';
import 'package:lingolab/screens/chaptersandtests.dart';
import 'package:lingolab/screens/coursedetails.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/state/loginstate.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:provider/provider.dart';

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
    return GestureDetector(
      onTap: (){
        String courseId=Provider.of<SelectionNotifier>(context,listen:false).courseSelected;
        String userId=Provider.of<LoginNotifier>(context,listen:false).userId;
        String level=(widget.level=="Beginer")?"a":(widget.level=="Intermediate")?"b":"c";
        userPurchase(context,userId,courseId,level);


        Future<String> loadResult() async{
          Future<String> result=Future.delayed(Duration(milliseconds: 0),() async{
            await userPurchase(context,userId,courseId,level);
            return "Success";
          });
          return result;
        }
        fetchResult() async{
          String resultFetched=await loadResult();
//   ------------------------------------- ---------------------------------------------
          if(Provider.of<CourseNotifier>(context, listen: false).purchased=="success"){
            String Levels=(widget.level=="Beginer")?"a":(widget.level=="Intermediate")?"b":"c";
            String crseslcted=Provider.of<SelectionNotifier>(context,listen:false).courseSelected;
            Provider.of<CourseNotifier>(context, listen: false).loadDescription(context,crseslcted,Levels);
            Provider.of<CourseNotifier>(context, listen: false).loadChapterList(context,crseslcted,Levels);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                ActiveCourse()
            ));
          }
          else{
            String Levels=(widget.level=="Beginer")?"a":(widget.level=="Intermediate")?"b":"c";
            String crseslcted=Provider.of<SelectionNotifier>(context,listen:false).courseSelected;
            Provider.of<CourseNotifier>(context, listen: false).loadDescription(context,crseslcted,Levels);
            Provider.of<CourseNotifier>(context, listen: false).loadChapterList(context,crseslcted,Levels);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                CourseDetail(level: widget.level,imgloc: widget.imgloc)
            ));
          }
//  ----------------------------------------------------------------------------------------
        }
        fetchResult();


      },
      child: Container(
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
      ),
    );
  }
}
