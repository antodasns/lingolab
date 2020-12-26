//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:lingolab/model/videoebookmodel.dart';
//import 'package:lingolab/state/coursestate.dart';
//import 'package:lingolab/widgets/activecoursewidgets.dart';
//import 'package:provider/provider.dart';
//import 'package:video_player/video_player.dart';
//import 'package:chewie/chewie.dart';
//import 'package:chewie/src/chewie_player.dart';
////import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//
//class VideoPlayback3 extends StatefulWidget {
//  final String vdoname;
//  final String vdourl;
//  final String vdolength;
//  VideoPlayback3({Key key,this.vdoname,this.vdourl,this.vdolength}):super(key:key);
//  @override
//  _VideoPlaybackState createState() => _VideoPlaybackState();
//}
//
//class _VideoPlaybackState extends State<VideoPlayback3> {
////  YoutubePlayerController _controller;
////  void runYoutubePlayer(){
////    _controller = YoutubePlayerController(
////      initialVideoId: 'tcodrIK2P_I',
////      params: const YoutubePlayerParams(
////          playlist: [
////            'nPt8bK2gbaU',
////            'K18cpp_-gP8',
////            'iLnmTe5Q2Qw',
////            '_WoCV4c6XOE',
////            'KmzdUe0RSJo',
////            '6jZDSSZZxjQ',
////            'p2lYr3vM_1w',
////            '7QUtEmBT_-w',
////            '34_PXCzGw1M',
////          ],
////          startAt: const Duration(minutes: 1, seconds: 36),
////          showControls:true,
////          showFullscreenButton: true,
////          desktopMode: true,
////          privacyEnhanced: true,
////          showVideoAnnotations: false
////      ),
////    );
////
////  }
//
//  @override
////  void initState() {
////    runYoutubePlayer();
////    super.initState();
////  }
////
////  @override
////  void dispose() {
////    _controller.pause();
////    super.dispose();
////  }
//
//  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
//  Widget appBarTitle;
//  @override
//  Widget build(BuildContext context) {
//    const player = YoutubePlayerIFrame();
//    CourseNotifier videoebook = Provider.of<CourseNotifier>(context);
//    return YoutubePlayerControllerProvider(
//      controller: _controller,
//      child: LayoutBuilder(
//          builder: (context, constraints) {
//            return Scaffold(
//              resizeToAvoidBottomPadding: false,
//              extendBodyBehindAppBar: true,
//              appBar: AppBar(
//                leading: IconButton(
//                  icon: Icon(Icons.arrow_back, color: Colors.white),
//                  onPressed: () => Navigator.of(context).pop(),
//                ),
//                backgroundColor: Colors.transparent,
//                bottomOpacity: 0.0,
//                elevation: 0.0,
//                title: appBarTitle,
//                actions: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(Icons.share, color: Colors.white),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(Icons.favorite_border, color: Colors.white),
//                  ),
//                ],
//              ),
//              body: SingleChildScrollView(
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      height: 500,
//                      child: Center(
//                          child: player
//                      ),
//                    ),
//
//
//                    Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(18.0),
//                          child: Text("Related videos", style: TextStyle(
//                              fontSize: 15, color: Colors.black,
//                              fontWeight: FontWeight.w900)),
//                        ),
//                      ],
//                    ),
//                    for(VideoEbook x in videoebook.veList)
//                      Videos(vdoname: x.videoName,
//                          vdourl: x.videoUrl,
//                          videolength: x.videolength),
//                  ],
//                ),
//              ),
//            );
//          }
//      ),
//    );
//  }
//
//
//  Widget searchIcon(){
//    return Container(
//      height: 10,
//      width: 48,
//      padding: EdgeInsets.fromLTRB(0,10,10,10),
//      child: ClipOval(
//        child: Material(
//          color: Colors.grey[300], // button color
//          child: InkWell(
//            splashColor: Colors.grey[300], // inkwell color
//            child: SizedBox(width: 56, height: 56, child: actionIcon),
//            onTap: () {
//              setState(() {
//                if ( this.actionIcon.icon == Icons.search){
//                  this.actionIcon = new Icon(Icons.close);
//                  this.appBarTitle = new TextField(
//                    autofocus: true,
//                    style: new TextStyle(
//                      color: Colors.black54,
//                    ),
//                    decoration: new InputDecoration(
//                        prefixIcon: new Icon(Icons.search,color: Colors.black54),
//                        hintText: "Search...",
//                        hintStyle: new TextStyle(color: Colors.black54)
//                    ),
//                  );}
//                else {
//                  this.actionIcon = new Icon(Icons.search,color: Colors.black54);
//                  this.appBarTitle =null;
//                }
//              });
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}
