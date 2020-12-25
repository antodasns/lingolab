import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:lingolab/api/videoebookapi.dart';
import 'package:lingolab/model/videoebookmodel.dart';
import 'package:lingolab/screens/videoplayback.dart';
import 'package:lingolab/screens/videosandebooks.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Chapters extends StatefulWidget {
  final String chaptername;
  final String chapterid;
  Chapters({Key key,this.chaptername,this.chapterid}):super(key:key);
  @override
  _ChaptersState createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  @override
  Widget build(BuildContext context) {
    List<VideoEbook> velst = Provider.of<CourseNotifier>(context,listen:false).veListfull;
    List<VideoEbook> velsts = List<VideoEbook>();
    List<VideoEbook> vido = List<VideoEbook>();
    List<VideoEbook> ebo = List<VideoEbook>();
    velsts=velst.where((VideoEbook vels) => vels.chapterId ==widget.chapterid).toList();
    vido=velsts.where((VideoEbook vels) => vels.videoName !=null).toList();
    ebo=velsts.where((VideoEbook vels) => vels.ebookName !=null).toList();
    String vdoebocount=vido.length.toString()+" Videos | "+ebo.length.toString()+" E-books";
    return GestureDetector(
      onTap: (){
        Provider.of<SelectionNotifier>(context,listen:false).chapterId=widget.chapterid;
        Future<String> loadResult() async{
          Future<String> result=Future.delayed(Duration(milliseconds: 0),() async{
            await getVideoebookListFromFirestore(context,widget.chapterid);
            return "Success";
          });
          return result;
        }
        Future<String> fetchResult() async{
          String resultFetched=await loadResult();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>
              ChapterDetails(chapname: widget.chaptername,vdoebocount: vdoebocount)
          ));
          return "Done";
        }
        fetchResult();

      },
      child: Padding(
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
//                      Text("widget.chaptername",style: TextStyle(fontSize: 15,color: Colors.grey,
//                          fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,0,10),
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
                            Text(vdoebocount,style: TextStyle(fontSize: 15,color: Colors.grey,
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



class Videos extends StatefulWidget {
  final String vdoname;
  final String vdourl;
  Videos({Key key,this.vdoname,this.vdourl}):super(key:key);
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>
            VideoPlayback(vdoname:widget.vdoname,vdourl:widget.vdourl)
        ));
      },
      child: Padding(
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

                            Image.asset('assets/logo/A1.png',height: 70,width: 100,)
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
                              Text(widget.vdoname,style: TextStyle(fontSize: 17,color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Text("40 Min",style: TextStyle(fontSize: 15,color: Colors.grey,
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
      ),
    );
  }
}


class Ebook extends StatefulWidget {
  final String ebookname;
  final String ebookurl;
  Ebook({Key key,this.ebookname,this.ebookurl}):super(key:key);
  @override
  _EbookState createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/logo/phoneorange.png'),

                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,10,0,10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.ebookname,style: TextStyle(fontSize: 17,color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                  child: Text("30 Pages | 3.4 MB",style: TextStyle(fontSize: 15,color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 90,),
                      GestureDetector(
                        onTap: ()async{
                          final status = await Permission.storage.request();

                          if (status.isGranted) {
                            final externalDir = await ExtStorage.getExternalStoragePublicDirectory(
                                ExtStorage.DIRECTORY_DOWNLOADS);

                            final id = await FlutterDownloader.enqueue(
                              url:widget.ebookurl,
                              savedDir: externalDir,
                              showNotification: true,
                              openFileFromNotification: true,
                            );


                          } else {
                            print("Permission deined");
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.file_download)
                          ],
                        ),
                      ),
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