import 'package:flutter/material.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/screens/signup.dart';

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
      },
    );
  }
}

