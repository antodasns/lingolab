import 'package:flutter/cupertino.dart';

class SelectionNotifier with ChangeNotifier{
  String _courseSelected;
  String _courseName;

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
}