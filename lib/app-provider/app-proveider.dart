import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String appLanguage='en';
  void changeAppLanguage(String lagCode){
    appLanguage=lagCode;
    notifyListeners();
  }
}