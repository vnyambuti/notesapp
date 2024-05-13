import 'package:flutter/material.dart';
import 'package:notes/Themes/theme.dart';

class THemeProvider with ChangeNotifier {
  ThemeData _themedata = ligtmode;

  ThemeData get themedata => _themedata;

  bool get isDark => _themedata == darkmode;

  set themedata(ThemeData themeData) {
    _themedata = themeData;
    notifyListeners();
  }

  void toogletheme() {
    if (_themedata == ligtmode) {
      themedata = darkmode;
    } else {
      themedata = ligtmode;
    }
  }
}
