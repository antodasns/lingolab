import 'package:flutter/material.dart';
import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/screens/signup.dart';
import 'package:lingolab/screens/verifyphone.dart';
import 'package:lingolab/screens/otp.dart';

void main() {
  runApp(LingoLab());
}

class LingoLab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login":(context) => LogIn(),
        "/signup":(context) => SignUp(),
        "/forgotpassword":(context) => ForgotPassword(),
        "/verifyphone":(context) => VerifyPhone(),
        "/otp":(context) => Otp(),
      },
    );
  }
}

