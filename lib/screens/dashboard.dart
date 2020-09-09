import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lingolab/widgets/subjectlist.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override

  Widget appBarTitle = new Image.asset('assets/logo/lingolab.png', height: 160,width: 160);
  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  int selectedIndex = 2;
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("NO",style: TextStyle(
                  color: Colors.green
              ),),
            ),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => SystemNavigator.pop(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("YES",style: TextStyle(
                color: Colors.red
                ),
            ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = new GoogleSignIn();
  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();

    });
  }
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.12:(appHeight<=775)?appHeight*.11: appHeight*.10;
    double boxappheight2=(appHeight<=700)?appHeight*.1:(appHeight<=775)?appHeight*.09: appHeight*.09;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
          title: appBarTitle,
            actions: <Widget>[
              searchIcon(),
            ]
        ),
        body: Container(
          color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperTwo(flip: true),
                  child: Container(
                    height: 500,
                    width: appWidth,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,110,0,0),
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20,0,20,20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SubjectList(imglocation:"assets/logo/english.png",subjectname:"English"),
                                SubjectList(imglocation:"assets/logo/german.png",subjectname:"German"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20,0,20,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SubjectList(imglocation:"assets/logo/french.png",subjectname:"French"),
                                SubjectList(imglocation:"assets/logo/hindi.png",subjectname:"Hindi"),
                              ],
                            ),
                          ),

//    Area below Wave.....................................................

                          Container(
                            padding: EdgeInsets.fromLTRB(20,55,20,20),
                            alignment: Alignment.topLeft,
                            child: Text('Practice,Perform,Perfect',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),

                          Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/logo/weeklytest.png"),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Upcoming Weekly Test",
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.black),),
                                    Text(" Start in",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,0,0,10),
                                  alignment: Alignment.bottomRight,
                                  width: appWidth*.25,
                                  height: appHeight*.1,
                                  child: Text("10h:25m:12s",
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.orange),),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height:15),
                          Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/logo/practicetest.png"),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Practice Test",
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.black),),
                                    Text("20 Apr @ 9:30-12:00PM",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: () {
                                    },
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                                    padding: const EdgeInsets.all(0.0),
                                    textColor: Colors.white,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(20,8,20,8),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight:  Radius.circular(50),topLeft:Radius.circular(50),bottomRight:  Radius.circular(50),bottomLeft:Radius.circular(50) ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [0.1, 0.3,],
                                          colors: <Color>[
                                            Colors.redAccent,
                                            Colors.deepOrangeAccent,
                                          ],
                                        ),
                                      ),
                                      child: const Text(
                                          'Take Test',
                                          style: TextStyle(fontSize: 15)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height:80),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),



        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            showSelectedItemShadow: false,
            barHeight: 70,
          ),
          selectedIndex: selectedIndex,
          onSelectTab: (index) {
            setState(() {
              selectedIndex = index;
              if(index==4){
                gooleSignout();
                Navigator.pushReplacementNamed(context, '/login');
              }
              else{
                print("error");
              }
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.chat,
              label: 'Chat',
              selectedBackgroundColor: Colors.deepOrangeAccent,
            ),
            FFNavigationBarItem(
              iconData: Icons.notifications_active,
              label: 'Notifications',
              selectedBackgroundColor: Colors.deepOrangeAccent,
            ),
            FFNavigationBarItem(
              iconData: Icons.home,
              label: 'Home',
              selectedBackgroundColor: Colors.deepOrangeAccent,
            ),
            FFNavigationBarItem(
              iconData: Icons.insert_chart,
              label: 'Results',
              selectedBackgroundColor: Colors.deepOrangeAccent,
            ),
            FFNavigationBarItem(
              iconData: Icons.settings,
              label: 'Settings',
              selectedBackgroundColor: Colors.deepOrangeAccent,
            ),
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
                  this.appBarTitle = new Image.asset('assets/logo/lingolab.png', fit: BoxFit.cover,
                      height: 160,width: 160);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}