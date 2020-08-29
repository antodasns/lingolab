import 'package:flutter/material.dart';
import 'package:lingolab/widgets/timer.dart';
import 'package:lingolab/widgets/otpwidget.dart';
class Otp extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String password;
  const Otp ({ Key key, this.name,this.email,this.phone,this.password}): super(key: key);

  @override
  _OtpState createState() => _OtpState();
}
class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    String Name=widget.name;
    String Email=widget.email;
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
                Text("Phone Verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    )
                ),
                SizedBox(height: boxappheight),
                Text(
                    "We have sent you an SMS with a code to number +91 0001110001$Name$Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54)
                ),
                SizedBox(height: boxappheight),
                OtpWidget("+8801376221100"),
                OtpTimer(),
                SizedBox(height: appHeight * .07),
                Text(
                    "Don't you received any code?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54)
                ),
                Text(
                    "Resend a new code",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
