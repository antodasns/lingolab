import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/model/videoebookmodel.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/widgets/activecoursewidgets.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';

class VideoPlayback2 extends StatefulWidget {
  final String vdoname;
  final String vdourl;
  final String vdolength;
  VideoPlayback2({Key key,this.vdoname,this.vdourl,this.vdolength}):super(key:key);
  @override
  _VideoPlaybackState createState() => _VideoPlaybackState();
}

class _VideoPlaybackState extends State<VideoPlayback2> {

  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        widget.vdourl);
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4');
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
        routePageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation, provider) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: provider,
                ),
              );

            },
          );
        }
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  Widget appBarTitle;
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
              height: 350,
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
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
            for(VideoEbook x in videoebook.veList)
              Videos(vdoname:x.videoName,vdourl:x.videoUrl,videolength:x.videolength),
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
