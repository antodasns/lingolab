import 'package:flutter/cupertino.dart';

class LoginNotifier with ChangeNotifier{
  bool _isSignIn;
  String _userId;

  bool get isSignIn => _isSignIn;
  set signIn(bool signin){
    _isSignIn = signin;
    notifyListeners();
  }

  String get userId => _userId;
  set userId(String selection){
    _userId = selection;
    notifyListeners();
  }
}