import 'package:flutter/material.dart';
import 'package:lingolab/screens/coursedetailtheme.dart';

class CourseCurriculum extends StatefulWidget {
  final String slno;
  final String content;
  const CourseCurriculum ({Key key,this.slno,this.content}):super(key:key);
  @override
  _CourseCurriculumState createState() => _CourseCurriculumState();
}

class _CourseCurriculumState extends State<CourseCurriculum> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(
              child: Text(
                widget.slno,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.content,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: DesignCourseAppTheme.grey,
            ),
          ),
        ),
      ],
    );
  }
}
