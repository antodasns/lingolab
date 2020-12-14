import 'package:flutter/cupertino.dart';

class LingoNotifier with ChangeNotifier{
  bool _isSignIn;

  bool get isSignIn => _isSignIn;
  set signIn(bool signin){
    _isSignIn = signin;
    notifyListeners();
  }
}