import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:lingolab/api/paymentapi.dart';
import 'package:lingolab/screens/paymentsuccess.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:lingolab/state/loginstate.dart';
import 'package:lingolab/state/selectionstate.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    double boxappheight=(appHeight<=700)?appHeight*.12:(appHeight<=775)?appHeight*.11: appHeight*.10;
    double boxappheight2=(appHeight<=700)?appHeight*.1:(appHeight<=775)?appHeight*.09: appHeight*.09;
    String crselvl=Provider.of<CourseNotifier>(context,listen:false).courseLevel;
    String courseLevel=(crselvl=="a")?"Beginer":(crselvl=="b")?"Intermediate":"Advance";
    return Scaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        gradient: LinearGradient(colors: [Colors.deepOrange, Colors.orange]),
        title: Center(child: Text("Purchase Details")),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height*.35,
              width: MediaQuery.of(context).size.width,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.network(Provider.of<SelectionNotifier>(context,listen:false).courseImg,height: 80,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text("Total: "),
                              Text(Provider.of<CourseNotifier>(context,listen:false).coursePrice,style: TextStyle(fontSize:15.0 ,
                                fontWeight: FontWeight.w800,
                                color: Colors.deepOrangeAccent,
                              ),),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,50,10),
                          child: Text(Provider.of<SelectionNotifier>(context,listen:false).courseName+"("+courseLevel+")",
                            style: TextStyle(fontSize:20.0 ,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),),
                        ),
                        Text("50 Videos|30 E-Books",
                          style: TextStyle(fontSize:15.0 ,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20,0,0,0),
                      width: MediaQuery.of(context).size.width*.8,
                      decoration: BoxDecoration(
                        color: Color(0xFFFf7f7f7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text("Apply",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15,fontWeight: FontWeight.w500),),
                              )
                            ),
                            hintText: "Enter Coupon"),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Payment Method",style: TextStyle(fontSize: 15),),
                          Text("+Add a new card",style: TextStyle(color: Colors.deepOrangeAccent),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: appWidth*.92,
                        height: boxappheight2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('assets/logo/A1.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Credit/Debit Card",
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.black),),
                                Text("Ending in 1560",
                                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.grey),),
                              ],
                            ),
                            Container(
                              child: Radio(activeColor: Colors.deepOrangeAccent,
                                  value: 1, groupValue: 1, onChanged: null)
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: appWidth*.92,
                        height: boxappheight2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('assets/logo/A1.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Credit/Debit Card",
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.black),),
                                Text("Ending in 1560",
                                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.grey),),
                              ],
                            ),
                            Container(
                                child: Radio(activeColor: Colors.deepOrangeAccent,
                                    value: 1, groupValue: 1, onChanged: null)
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: appWidth*.92,
                        height: boxappheight2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('assets/logo/A1.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Credit/Debit Card",
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.black),),
                                Text("Ending in 1560",
                                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.grey),),
                              ],
                            ),
                            Container(
                                child: Radio(activeColor: Colors.deepOrangeAccent,
                                    value: 1, groupValue: 1, onChanged: null)
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){
                    String courseId=Provider.of<SelectionNotifier>(context,listen:false).courseSelected;
                    String courseLevel=Provider.of<CourseNotifier>(context,listen:false).courseLevel;
                    String userId=Provider.of<LoginNotifier>(context, listen: false).userId;

                    courseBrought(courseId,courseLevel,userId);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        PaymentSuccess()
                    ));
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
                      child: Text("Continue with Card",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                    SizedBox(height: 50,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
