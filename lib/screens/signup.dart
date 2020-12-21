import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/screens/otp.dart';
import 'package:lingolab/state/loginstate.dart';
import 'package:lingolab/widgets/textfields.dart';
import 'package:provider/provider.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SigningUp signingUp =SigningUp();
  GlobalKey<FormState>_formKey = GlobalKey();
  FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
//  save()async{
//    await _firebaseAuth.createUserWithEmailAndPassword(email: signingUp.email, password: signingUp.password)
//    .then((user){
//      print('signed in as ${user.user.uid}');
//    });
//    _firebaseAuth.verifyPhoneNumber(
//        phoneNumber: null,
//        verificationCompleted: null,
//        verificationFailed: null,
//        codeSent: null,
//        codeAutoRetrievalTimeout: null
//    );
//  }

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  bool checkvalue=false;
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
      Navigator.pushNamed(context, "/dashboard");
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
    double boxappheight=(appHeight<=700)?appHeight*.03:(appHeight<=775)?appHeight*.04: appHeight*.05;

    return Scaffold(

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
                ]
                )
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
                              child: Form(
                                key: _formKey,
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
                                    acceptTermsTextRow(),
                                    submitButton(),
                                    _divider(),
                                    socialIconsRow(),
                                    _createAccountLabel(),
                                  ],
                                ),
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

  Widget fullName(){
    return CustomTextField(
      hint:"Full Name",
      icon: Icons.account_circle,
      keyboardType: TextInputType.text,
      textEditingController: fullnameController,
      onPressed: (value) {
        signingUp.fullname = value;
      },
    );
  }
  Widget email(){
    return CustomTextField(
      hint:"Email ID",
      icon: Icons.email,
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      onPressed: (value) {
        signingUp.email = value;
      },
    );
  }
  Widget phone(){
    return CustomTextField(
      hint:"Phone No",
      icon: Icons.phone,
      keyboardType: TextInputType.phone,
      textEditingController: phoneController,
      onPressed: (value) {
        signingUp.phoneno = value;
      },
    );
  }
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
      child: TextFormField(
        controller: passwordController,
        onChanged: (value) {
          signingUp.password = value;
        },
        obscureText: !_showPassword,
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

  Widget acceptTermsTextRow() {

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.blue[400],
              value: checkvalue,
              onChanged: (bool newValue) {
                setState(() {
                  (checkvalue==false)?checkvalue=true:checkvalue=false;
                });
              }),
          Text(
            "I accept all ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          Text(
            "terms and conditions",
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
        ],
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
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Color(0xff00a2e1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget submitButton(){
    return RaisedButton(
      onPressed: (){
        if (phoneController.text.length==10) {
          if (passwordController.text.length>=6) {
          if (checkvalue==true) {
            var route = new MaterialPageRoute(
              builder: (BuildContext context) =>
              new Otp(name: fullnameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  password: passwordController.text
              ),
            );
            Navigator.of(context).push(route);
          }
          else{
            showToast("Please accept the terms and conditions", Colors.red);
          }
          } else {
            showToast("Password should be at least 6 characters", Colors.red);
          }
        } else {
          showToast("Please enter only 10 Digit mobile no without country code", Colors.red);
        }
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

class SigningUp{
  String fullname;
  String email;
  String phoneno;
  String password;

  SigningUp({
    this.fullname,
    this.email,
    this.phoneno,
    this.password
  });
}