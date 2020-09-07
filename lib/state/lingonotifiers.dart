import 'package:flutter/cupertino.dart';

class LingoNotifier with ChangeNotifier{
String _verifyid;

set verif(String detail){
  _verifyid = detail;
  notifyListeners();
}

String get verifyid => _verifyid;
}