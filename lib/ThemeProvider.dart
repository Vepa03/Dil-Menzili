import 'package:flutter/material.dart';
import 'package:menzil_yoly/theme/Theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = light_mode;
  ThemeData get themeData => _themeData;
  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == light_mode){
      themeData = dark_mode;
    }else {
      themeData = light_mode;
    }
  }
}
