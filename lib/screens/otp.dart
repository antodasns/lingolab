import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lingolab/screens/dashboard.dart';
import 'package:lingolab/widgets/timer.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';

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
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();


  bool isCodeSent = false;
  String _verificationId;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    _onVerifyCode();
  }
  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }
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
          onPressed: () => Navigator.of(context).popAndPushNamed("/signup"),
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
                    "We have sent you an SMS with a code to number +91 ${widget.phone}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54)
                ),
                SizedBox(height: boxappheight),
                OtpWidget(),
                OtpTimer(),
                SizedBox(height: appHeight * .07),
                Text(
                    "Don't you received any code?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54)
                ),
                InkWell(
                  onTap:() {
                _onVerifyCode();
                showToast("OTP resend successfully.", Colors.red);
                  },
                  child: Text(
                      "Resend a new code",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget OtpWidget(){
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0),
          child: PinCodeTextField(
            textInputType: TextInputType.number,
            textStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.w900,fontSize: 18),
            length: 6,
            obsecureText: false,
            animationType: AnimationType.fade,
            validator: (v) {
              if (v.length < 3) {
                return "I'm from validator";
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: Colors.deepOrangeAccent,
              activeFillColor:Colors.deepOrangeAccent,
              inactiveColor: Colors.grey[300],
              inactiveFillColor: Colors.grey[300],
              selectedFillColor: Colors.grey[300],
              selectedColor: Colors.grey[300],
            ),

            backgroundColor: Colors.white10,
            enableActiveFill: true,
            autoDisposeControllers: false,
            errorAnimationController: errorController,
            controller: _pinEditingController,
            onCompleted: (v) {
              _onFormSubmitted();
              print("Completed");
            },
            onChanged: (value) {
              print(value);
              setState(() {
                currentText = value;
              });
            },
          )),
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

  void _onVerifyCode() async {
    setState(() {
      isCodeSent = true;
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {

        _firebaseAuth.createUserWithEmailAndPassword(email: widget.email, password: widget.password)
            .then((user){
          _firebaseAuth
              .signInWithCredential(phoneAuthCredential)
              .then((numberuser) {
          if (numberuser.user != null) {
            // Handle loogged in state
            print(user.user.phoneNumber);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          } else {
            showToast("Error validating OTP, try again", Colors.red);
            user.user.delete();
          }
        }).catchError((error) {
            showToast("Error validating OTP, try again", Colors.red);
            user.user.delete();
          });
      }).catchError((error) {
          showToast(error.message, Colors.red);
        });
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showToast(authException.message, Colors.red);
      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void _onFormSubmitted() async {
      AuthCredential _authCredential = PhoneAuthProvider.getCredential(
          verificationId: _verificationId, smsCode: _pinEditingController.text);
      _firebaseAuth.createUserWithEmailAndPassword(
          email: widget.email, password: widget.password)
          .then((user) {
        _firebaseAuth
            .signInWithCredential(_authCredential)
            .then((numberuser) {
          if (numberuser.user != null) {
            // Handle loogged in state
            print(user.user.phoneNumber);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          } else {
            showToast("Error validating OTP, try again", Colors.red);
            user.user.delete();
          }
        }).catchError((error) {
          showToast("Error validating OTP, try again", Colors.red);
          user.user.delete();
        });
      }).catchError((error) {
        showToast(error.message, Colors.red);
      });
  }
}

