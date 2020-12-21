import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/model/chaptermodel.dart';
import 'package:lingolab/screens/coursedetailtheme.dart';
import 'package:lingolab/screens/payment.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/widgets/coursecurriculum.dart';
import 'package:provider/provider.dart';

class CourseDetail extends StatefulWidget {
  final String level;
  final String imgloc;
  const CourseDetail ({Key key,this.level,this.imgloc}):super(key:key);
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {

    CourseNotifier chapter = Provider.of<CourseNotifier>(context);

    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:const EdgeInsets.only(
                              top: 32.0, left: 18, right: 16),
                          child: Image.asset(widget.imgloc),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32.0, left: 18, right: 16),
                          child: Text(
                            Provider.of<SelectionNotifier>(context,listen:false).courseName+"("+widget.level+')',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              letterSpacing: 0.27,
                              color: DesignCourseAppTheme.darkerText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 8, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                Provider.of<CourseNotifier>(context, listen: false).coursePrice+' ₹',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  letterSpacing: 0.27,
                                  color: DesignCourseAppTheme.nearlyBlue,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star_border,
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      size: 24,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      size: 24,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      size: 24,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      size: 24,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity1,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: <Widget>[
                                getTimeBoxUI('12', 'Classes'),
                                getTimeBoxUI('600', 'Mins'),
                                getTimeBoxUI('45', 'Test'),
                              ],
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Text(
                              Provider.of<CourseNotifier>(context, listen: false).courseDesc,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,0,20),
                          child: Text(
                            'Course Curriculum',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: DesignCourseAppTheme.grey,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,90),
                            child: Container(
                              width: MediaQuery.of(context).size.width*.92,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  for(Chapter x in chapter.chapterList)
                                  CourseCurriculum(slno:'01',content:x.chapterName),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
                    right: 35,
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: CurvedAnimation(
                          parent: animationController, curve: Curves.fastOutSlowIn),
                      child: Card(
                        color: DesignCourseAppTheme.nearlyBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        elevation: 10.0,
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Icon(
                              Icons.share,
                              color: DesignCourseAppTheme.nearlyWhite,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    child: SizedBox(
                      width: AppBar().preferredSize.height,
                      height: AppBar().preferredSize.height,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                          child: Icon(
                            Icons.arrow_back,
                            color: DesignCourseAppTheme.nearlyBlack,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.2,
                          0.3,
                        ],
                        colors: [
                          Colors.redAccent,
                          Colors.deepOrangeAccent,
                        ]
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: DesignCourseAppTheme
                              .nearlyBlue
                              .withOpacity(0.5),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>
                          Payment()
                      ));
                    },
                    child: Center(
                      child: Text(
                        'Join Course',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 0.0,
                          color: DesignCourseAppTheme
                              .nearlyWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}