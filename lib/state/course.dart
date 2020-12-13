import 'package:flutter/cupertino.dart';
import 'package:lingolab/api/courseapi.dart';
import 'package:lingolab/model/course.dart';


class CourseNotifier with ChangeNotifier{

  List <Course> _courseList = List<Course>();
  void loadCourseList(BuildContext context){
//    _courseList=courseList;
    getCourseListFromFirestore(context);
    notifyListeners();
  }

  List <Course> get courseList => _courseList;
  set courseList(newValue) {
    _courseList = newValue;
    notifyListeners();
  }

}