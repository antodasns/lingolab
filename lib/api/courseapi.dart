import 'package:flutter/cupertino.dart';
import 'package:lingolab/model/course.dart';
//import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingolab/state/course.dart';
import "package:provider/provider.dart";

void getCourseListFromFirestore(BuildContext context) async {

  FirebaseFirestore.instance.collection('courses').get().then((querySnapshot) {
    List<Course> courseList = List<Course>();
    querySnapshot.docs.forEach((document) {
      courseList.add(mapFirestoreDocToCourse(document));
    print("hhh");
    });

    Provider.of<CourseNotifier>(context, listen: false).courseList = courseList;
  });

}
Course mapFirestoreDocToCourse(document) {
  Course course = Course();
  document.data().forEach((key, value) {

    if (key == 'course_id') {
      course.courseId = value;
    } else {
      course.courseName=value;
    }
  });

  return course;
}