

import 'package:flutter/cupertino.dart';


class SelectionNotifier with ChangeNotifier{
  String _courseSelected;
  String _courseName;
  String _courseImg;
  String _chapterId;
  String _vdoselectId;
  String _vdoebocount;
  String _chapName;


  String get courseSelected => _courseSelected;
  set courseSelected(String selection){
    _courseSelected = selection;
    notifyListeners();
  }

  String get courseName => _courseName;
  set courseName(String selection){
    _courseName = selection;
    notifyListeners();
  }
  String get courseImg => _courseImg;
  set courseImg(String selection){
    _courseImg = selection;
    notifyListeners();
  }

  String get chapterId => _chapterId;
  set chapterId(String selection){
    _chapterId = selection;
    notifyListeners();
  }

  String get vdoselectId => _vdoselectId;
  set vdoselectId(String selection){
    _vdoselectId = selection;
    notifyListeners();
  }

  String get vdoebocount => _vdoebocount;
  set vdoebocount(String selection){
    _vdoebocount = selection;
    notifyListeners();
  }
  String get chapName => _chapName;
  set chapName(String selection){
    _chapName = selection;
    notifyListeners();
  }

}