import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lingolab/screens/dashboard.dart';
import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/screens/signup.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/state/loginstate.dart';
import 'package:lingolab/widgets/textfields.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  FirebaseAuth _auth = FirebaseAuth.instance;
//  FirebaseUser depriciated so use User
  User _user;

  GoogleSignIn _googleSignIn = new GoogleSignIn();
  bool isSignIn = false;

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

//    They have renamed the class 'AuthResult' to 'UserCredential'

    UserCredential result = (await _auth.signInWithCredential(credential));

    _user = result.user;

    setState(() {
      Provider.of<LoginNotifier>(context, listen: false).signIn=true;
      Provider.of<LoginNotifier>(context, listen: false).userId=_user.uid;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
  }

  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        Provider.of<LoginNotifier>(context, listen: false).signIn=false;
      });
    });
  }



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
  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  Widget email(){
    return CustomTextField(
      hint:"Email ID",
      icon: Icons.email,
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
    );
  }

//  Widget password(){
//    return CustomTextField(
//      hint:"Password",
//      icon: Icons.lock,
//    );
//  }
  Widget password() {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width*.92,
      decoration: BoxDecoration(
        color: Color(0xFFFf7f7f7),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 7),
            blurRadius: 12,
            spreadRadius: 0,
            color: Colors.grey,
          ),
        ],
      ),
      child: TextField(
        obscureText: !_showPassword,
        controller: passwordController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock,color: Colors.deepOrangeAccent,),
            border: InputBorder.none,
            hintText: "Password",
          suffixIcon: GestureDetector(
            onTap: () {
              _togglevisibility();
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons
                  .visibility_off, color: Colors.deepOrangeAccent,),
          ),
        ),
      ),
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
          Text("SignIn with "),
          GestureDetector(
            onTap: () {
              handleSignIn();

            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/logo/google.jpg"),
              backgroundColor: Colors.white,
            ),
          ),
//          SizedBox(
//            width: 30,
//          ),
//          CircleAvatar(
//            radius: 15,
//            backgroundImage: AssetImage("assets/logo/facebook.jpg"),
//          ),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPassword()),
        );
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
      onPressed: (){
        FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
        _firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
      .then((user) {
          Provider.of<LoginNotifier>(context, listen: false).signIn=true;
          Provider.of<LoginNotifier>(context, listen: false).userId=user.user.uid;
            Navigator.pushNamed(context, "/dashboard");
          }).catchError((error) {
          showToast("Username or Password mismatch", Colors.red);
        });
      },
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
