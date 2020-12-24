import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingolab/screens/aa.dart';
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
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/state/loginstate.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:lingolab/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => LoginNotifier()),
//        ChangeNotifierProvider(create: (_) => CourseNotifier()),
        ChangeNotifierProvider(create: (_) => SelectionNotifier()),
        ChangeNotifierProvider<CourseNotifier>(
          create: (context) => CourseNotifier(),
        ),
      ],
      child: LingoLab()));
}

class LingoLab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: (FirebaseAuth.instance.currentUser!=null)?"/dashboard":"/login",
      routes: {
        "/pull":(context) => ChewieDemo(),
        "/login":(context) => LogIn(),
        "/signup":(context) => SignUp(),
        "/forgotpassword":(context) => ForgotPassword(),
        "/otp":(context) => Otp(),
        "/dashboard":(context) => Dashboard(),
        "/courselevels":(context) => Courselevels(),
        "/coursedetail":(context) => CourseDetail(),
        "/payment":(context) => Payment(),
        "/paymentSuccess":(context) => PaymentSuccess(),
        "/activecourse":(context) => ActiveCourse(),
        "/chpterdetails":(context) => ChapterDetails(),
        "/videoplayback":(context) => VideoPlayback(),
      },
    );
  }
}

