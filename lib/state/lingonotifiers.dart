import 'package:flutter/cupertino.dart';

class LingoNotifier with ChangeNotifier{
  bool _isSignIn;

void signIn(bool signin){
  _isSignIn = signin;
  notifyListeners();
}

  bool get isSignIn => _isSignIn;
}