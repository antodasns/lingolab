import 'package:flutter/material.dart';
import 'package:lingolab/screens/signup.dart';
import 'package:lingolab/widgets/textfields.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    print(appWidth*.09);
    print(appHeight);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.1,
                      0.3,
                    ],
                    colors: [
                      Colors.redAccent,
                      Colors.deepOrangeAccent,
                    ])
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(appWidth*.23,0,0,0),
            child: Container(
                width: 210.00,
                height: appHeight*.3,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/logo/lingolabwhite.png'),
                    fit: BoxFit.fitWidth,
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,appHeight*.25,0,0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: appHeight,
                    width: appWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight:  Radius.circular(50),topLeft:Radius.circular(50) ),
                      color: Colors.white,
                    ),
                    child:SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(

                          children: <Widget>[
                            SizedBox(height: 10),
                            Text("LogIn",
                                style: TextStyle(fontSize:30.0 ,
                                    fontWeight: FontWeight.w900,
                                  color: Color(0xFFF616161),
                                )
                            ),

                            SizedBox(height: appHeight*.04),
                            email(),

                            SizedBox(height: appHeight*.04),
                            password(),

                            SizedBox(height: appHeight*.04),
                            forgotPassword(),
                            SizedBox(height: appHeight*.04),
                            submitButton(),
                            _divider(),
                            socialIconsRow(),
                            SizedBox(height: appHeight*.04),
                            _createAccountLabel(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget email(){
    return CustomTextField(
      hint:"Email ID",
      icon: Icons.email,
    );
  }

  Widget password(){
    return CustomTextField(
      hint:"Password",
      icon: Icons.lock,
    );
  }


  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {

            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/logo/google.jpg"),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/logo/facebook.jpg"),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an account ?",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'SignUp',
              style: TextStyle(
                  color: Color(0xff00a2e1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return InkWell(
      onTap: () {

      },
      child: Container(

        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.67, 0, 0, 0),
        alignment: Alignment.bottomCenter,
        child: Row(

          children: <Widget>[

            Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Color(0xff00a2e1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      onPressed: (){},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3,],
                colors: [
                  Colors.redAccent,
                  Colors.deepOrangeAccent,
                ]),
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text("Submit",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
