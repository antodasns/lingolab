import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  Widget appBarTitle = new Image.asset('assets/logo/lingolab.png', fit: BoxFit.contain,
      height: 160);
  Icon actionIcon = new Icon(Icons.search,color: Colors.black54);
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.12:(appHeight<=775)?appHeight*.11: appHeight*.10;
    double boxappheight2=(appHeight<=700)?appHeight*.1:(appHeight<=775)?appHeight*.09: appHeight*.09;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        title: appBarTitle,
          actions: <Widget>[
            Container(
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
                          this.appBarTitle = new Image.asset('assets/logo/lingolab.png', fit: BoxFit.contain,
                              height: 140);
                        }
                      });
                    },
                  ),
                ),
              ),
            )
          ]
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(18),
                alignment: Alignment.topLeft,
                child: Text('Hi, what would you learn today?',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: boxappheight,
                        width: appWidth*.45,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [
                                  0.1,
                                  0.8,
                                ],
                                colors: [
                                  Colors.redAccent,
                                  Colors.orangeAccent,
                                ]),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                          CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/logo/facebook.jpg"),
                          ),
                            Text("English",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                          ],
                        )
                    ),
                    Container(
                        height: boxappheight,
                        width: appWidth*.45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                0.5,
                                1,
                              ],
                              colors: [
                                Color(0xff364b6e),
                                Colors.blue[800],
                              ]),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/logo/facebook.jpg"),
                            ),
                            Text("German",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        height: boxappheight,
                        width: appWidth*.45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                0.1,
                                0.8,
                              ],
                              colors: [
                                Colors.blue,
                                Colors.lightBlueAccent,
                              ]),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/logo/facebook.jpg"),
                            ),
                            Text("French",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                          ],
                        )
                    ),
                    Container(
                        height: boxappheight,
                        width: appWidth*.45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                0.1,
                                0.9,
                              ],
                              colors: [
                                Colors.green,
                                Colors.greenAccent,
                              ]),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/logo/facebook.jpg"),
                            ),
                            Text("Hindi",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                alignment: Alignment.topLeft,
                child: Text('Practice,Perform,Perfect',style: TextStyle(
                  fontSize: 25,
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
                      radius: 20,
                      backgroundImage: AssetImage("assets/logo/facebook.jpg"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Upcoming Weekly Test",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),),
                        Text(" Start in",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.grey),),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,0,0,10),
                      alignment: Alignment.bottomRight,
                      width: appWidth*.25,
                      height: appHeight*.1,
                      child: Text("10h:25m:12s",
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.orange),),
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
                      radius: 20,
                      backgroundImage: AssetImage("assets/logo/facebook.jpg"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Practice Test",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),),
                        Text("20 Apr @ 9:30-12:00PM",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.grey),),
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
                              style: TextStyle(fontSize: 16)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
    );
  }
}