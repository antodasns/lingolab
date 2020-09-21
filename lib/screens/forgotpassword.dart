import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/widgets/textfields.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight = appHeight * .05;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white10,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                SizedBox(height: boxappheight),
                Text("Forgot Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    )
                ),
                SizedBox(height: boxappheight),
                Text(
                  "Please enter your email address.you will receive a code to create a new password via email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54)
                ),
                SizedBox(height: boxappheight),
                email(),
                SizedBox(height: appHeight * .07),
                submitButton(),
              ],
            ),
          ),
        ),
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
  Widget email() {
    return CustomTextField(
      hint:"Your email address",
      icon: Icons.account_circle,
      keyboardType: TextInputType.text,
      textEditingController: emailController,
      onPressed: (value) {

      },
    );
  }
  Widget submitButton() {
    return RaisedButton(
      onPressed: () async {
        showAlert(context);
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
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
          child: Text("Reset password",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius:
          BorderRadius.all(Radius.circular(15))),
          title: Column(
              children: [
                Image.asset(
                  'assets/logo/unlock.png',
                  width: 50, height: 50, fit: BoxFit.contain),
                SizedBox(height: 15,),
                Text('Code has been send.'),
                SizedBox(height: 15,),
                Text("You will shortly receive an email with a code to reset the password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.black54),
                ),
                SizedBox(height: 15,),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                  padding: const EdgeInsets.all(0.0),
                  textColor: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(80,10,80,10),
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
                    child: const Text('Done',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                ),
              ]
          ),
        );
      },
    );
  }
}