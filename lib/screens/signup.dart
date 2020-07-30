import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/widgets/textfields.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.02:(appHeight<=775)?appHeight*.03: appHeight*.04;

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
                      height: appHeight*.22,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/logo/lingolabwhite.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,appHeight*.18,0,0),
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
                                  Text("SignUp",
                                    style: TextStyle(fontSize:30.0 ,
                                        fontWeight: FontWeight.w900,
                                      color: Color(0xFFF616161),)
                                  ),
                                  SizedBox(height: boxappheight),
                                  fullName(),
                                  SizedBox(height: boxappheight),
                                  email(),
                                  SizedBox(height: boxappheight),
                                  phone(),
                                  SizedBox(height: boxappheight),
                                  password(),
                                  SizedBox(height: boxappheight),
                                  confirmPassword(),
                                  SizedBox(height: boxappheight),
                                  submitButton(),
                                  _divider(),
                                  socialIconsRow(),
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
  Widget fullName(){
    return CustomTextField(
      hint:"Full Name",
      icon: Icons.account_circle,
    );
  }
  Widget email(){
    return CustomTextField(
      hint:"Email ID",
      icon: Icons.email,
    );
  }
  Widget phone(){
    return CustomTextField(
      hint:"Phone No",
      icon: Icons.phone,
    );
  }
  Widget password(){
    return CustomTextField(
      hint:"Password",
      icon: Icons.lock,
    );
  }
  Widget confirmPassword(){
    return CustomTextField(
      hint:"Confirm Password",
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
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => LogIn()),
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
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Log In',
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
