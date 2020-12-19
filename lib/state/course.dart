import 'package:flutter/cupertino.dart';
import 'package:lingolab/api/chapterapi.dart';
import 'package:lingolab/api/courseapi.dart';
import 'package:lingolab/model/chapter.dart';
import 'package:lingolab/model/course.dart';


class CourseNotifier with ChangeNotifier{

  List <Course> _courseList = List<Course>();
  void loadCourseList(BuildContext context){
//    _courseList=courseList;
    getCourseListFromFirestore(context);
  }

  List <Course> get courseList => _courseList;
  set courseList(newValue) {
    _courseList = newValue;
    notifyListeners();
  }


 //Chapterss-----------------------

  List <Chapter> _chapterList = List<Chapter>();
  void loadChapterList(BuildContext context,courseid,level){
    getChapterListFromFirestore(context,courseid,level);
  }

  List <Chapter> get chapterList => _chapterList;
  set chapterList(newValue) {
    _chapterList = newValue;
    notifyListeners();
  }


}