import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class VerifyPhone extends StatefulWidget {
  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

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
                Text("Verify your \n Phone Number",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    )
                ),
                SizedBox(height: boxappheight),
                Text(
                    "We have sent you an SMS with a code to number +91 0001110001",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54)
                ),
                SizedBox(height: boxappheight),
                mobile(),
                SizedBox(height: appHeight * .07),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mobile() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 2, 0, 2),

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
      child: InternationalPhoneNumberInput(

            onInputChanged: (PhoneNumber number) {},
            onInputValidated: (bool value) {},
            ignoreBlank: false,
            autoValidate: false,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: controller,
            inputDecoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.cancel,color: Colors.grey),
            ),

      ),
      );


  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/otp');
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
          child: Text("Continue",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IN');
    setState(() {
      this.number = number;
    });
  }
}
