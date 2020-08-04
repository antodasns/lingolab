import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectList extends StatefulWidget {
  final String imglocation;
  final String subjectname;
  const SubjectList ({Key key,this.imglocation,this.subjectname}):super(key:key);
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.grey[300],
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(widget.imglocation),
            ),
            Text(widget.subjectname,
              style: GoogleFonts.crimsonText(
                  textStyle: TextStyle(color: Colors.black), fontSize: 22,fontWeight: FontWeight.w600),
            ),
          ],
        )
    );
  }
}
