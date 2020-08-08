import 'package:flutter/material.dart';
import 'package:lingolab/screens/activecourse.dart';
import 'package:lingolab/screens/coursedetails.dart';
import 'package:lingolab/screens/courselevels.dart';
import 'package:lingolab/screens/dashboard.dart';
import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/screens/payment.dart';
import 'package:lingolab/screens/paymentsuccess.dart';
import 'package:lingolab/screens/signup.dart';
import 'package:lingolab/screens/otp.dart';

void main() {
  runApp(LingoLab());
}

class LingoLab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/activecourse",
      routes: {
        "/login":(context) => LogIn(),
        "/signup":(context) => SignUp(),
        "/forgotpassword":(context) => ForgotPassword(),
        "/otp":(context) => Otp(),
        "/dashboard":(context) => Dashboard(),
        "/courselevels":(context) => Courselevels(),
        "/coursedetail":(context) => CourseDetail(),
        "/payment":(context) => Payment(),
        "/detail":(context) => DetailScreen(),
        "/activecourse":(context) => ActiveCourse(),
      },
    );
  }
}

