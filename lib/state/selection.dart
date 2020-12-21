

import 'package:flutter/cupertino.dart';


class SelectionNotifier with ChangeNotifier{
  String _courseSelected;
  String _courseName;
  String _courseImg;


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

}