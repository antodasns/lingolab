import 'package:flutter/cupertino.dart';
import 'package:lingolab/api/chapterapi.dart';
import 'package:lingolab/api/courseapi.dart';
import 'package:lingolab/api/videoebookapi.dart';
import 'package:lingolab/model/chaptermodel.dart';
import 'package:lingolab/model/coursemodel.dart';
import 'package:lingolab/model/videoebookmodel.dart';


class CourseNotifier with ChangeNotifier {

  List <Course> _courseList = List<Course>();

  void loadCourseList(BuildContext context) {
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

  void loadChapterList(BuildContext context, courseid, level) {
    getChapterListFromFirestore(context, courseid, level);
  }

  List <Chapter> get chapterList => _chapterList;

  set chapterList(newValue) {
    _chapterList = newValue;
    notifyListeners();
  }

  //course Description &&&& Price  --------------------

  String _courseDesc;
  String _coursePrice;
  String _courseLevel;

  void loadDescription(BuildContext context, courseid, level) {
    List<Course> courseLists = List<Course>();
    courseLists =
        courseList.where((Course crse) => crse.courseId == courseid).toList();
    _courseLevel = level;
    _courseDesc = courseLists[0].description;
    _coursePrice =
    (level == "a") ? courseLists[0].aprice : (level == "b") ? courseLists[0]
        .bprice : courseLists[0].cprice;
  }

  String get courseDesc => _courseDesc;

  set courseDesc(String selection) {
    _courseDesc = selection;
    notifyListeners();
  }

  String get coursePrice => _coursePrice;

  set coursePrice(String selection) {
    _coursePrice = selection;
    notifyListeners();
  }

  String get courseLevel => _courseLevel;

  set courseLevel(String selection) {
    _courseLevel = selection;
    notifyListeners();
  }

  //Purchase--------------------------

  String _purchased;
  String get purchased => _purchased;

  set purchased(String selection) {
    _purchased = selection;
    notifyListeners();
  }

//Video & Ebook---------------------------------------------------

  List <VideoEbook> _veList = List<VideoEbook>();

  void loadVeList(BuildContext context, chapterid) {
    getVideoebookListFromFirestore(context, chapterid);
  }

  List <VideoEbook> get veList => _veList;

  set veList(newValue) {
    _veList = newValue;
    notifyListeners();
  }
}