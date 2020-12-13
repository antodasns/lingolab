import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/screens/chaptersandtests.dart';
import 'package:lingolab/screens/videoplayback.dart';
import 'package:lingolab/screens/videosandebooks.dart';
import 'package:lingolab/screens/coursedetails.dart';
import 'package:lingolab/screens/courselevels.dart';
import 'package:lingolab/screens/dashboard.dart';
import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/screens/loginpage.dart';
import 'package:lingolab/screens/payment.dart';
import 'package:lingolab/screens/paymentsuccess.dart';
import 'package:lingolab/screens/signup.dart';
import 'package:lingolab/screens/otp.dart';
import 'package:lingolab/state/course.dart';
import 'package:lingolab/state/lingonotifiers.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => LingoNotifier()),
        ChangeNotifierProvider(create: (_) => CourseNotifier()),
      ],
      child: LingoLab()));
}

class LingoLab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<CourseNotifier>(context, listen: false).loadCourseList(context);
    Provider.of<LingoNotifier>(context, listen: false).signIn;
    return MaterialApp(
      initialRoute: (FirebaseAuth.instance.currentUser!=null)?"/dashboard":"/login",
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
        "/chpterdetails":(context) => ChapterDetails(),
        "/videoplayback":(context) => VideoPlayback(),
      },
    );
  }
}

