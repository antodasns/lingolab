import 'package:flutter/cupertino.dart';
import 'package:lingolab/model/coursemodel.dart';
//import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingolab/state/coursestate.dart';
import "package:provider/provider.dart";

Future<String> getCourseListFromFirestore(BuildContext context) async {

  await FirebaseFirestore.instance.collection('courses').get().then((querySnapshot) {

    List<Course> courseList = List<Course>();
    querySnapshot.docs.forEach((document) {
      courseList.add(mapFirestoreDocToCourse(document));
    });

    Provider.of<CourseNotifier>(context, listen: false).courseList = courseList;
  });
return "asd";
}
Course mapFirestoreDocToCourse(document) {
  Course course = Course();
  document.data().forEach((key, value) {

    if (key == 'course_id') {
      course.courseId = value;
    }
    if (key == 'course_name') {
      course.courseName = value;
    }
    if (key == 'icon') {
      course.icon = value;
    }
    if (key == 'description') {
      course.description = value;
    }
    if (key == 'aprice') {
      course.aprice = value;
    }
    if (key == 'bprice') {
      course.bprice = value;
    }
    if (key == 'cprice') {
      course.cprice = value;
    }
    if (key == 'aqstntest') {
      course.aqstntest = value;
    }
    if (key == 'bqstntest') {
      course.bqstntest = value;
    }
    if (key == 'cqstntest') {
      course.cqstntest = value;
    }

  });

  return course;
}