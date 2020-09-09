import 'package:flutter/cupertino.dart';

class LingoNotifier with ChangeNotifier{
  bool _isSignIn = false;

set signIn(bool signin){
  _isSignIn = signin;
  notifyListeners();
}

  bool get isSignIn => _isSignIn;
}