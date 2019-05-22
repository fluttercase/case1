import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeObject {
  Color primaryColor;
  Color backgroundColor;
  ThemeObject({
    this.primaryColor,
    this.backgroundColor,
  });
}
class ThemeName {
  static const theme1 = 'Theme1';
  static const theme2 = 'Theme2';
  static const theme3 = 'Theme3';
}
class CustomThemeData {
  StreamController<ThemeObject> _themectrl = StreamController.broadcast();
  String themeName;
  ThemeObject theme = ThemeObject(backgroundColor: Colors.white, primaryColor: Colors.black);
  CustomThemeData({this.themeName = ThemeName.theme1}){
    initData();
  }
  initData () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString('themeName');
    if (theme != null) {
      changeTheme(theme);
    }
  }
  Stream<ThemeObject> get stream {
    return _themectrl.stream;
  }
  ThemeObject get value => theme;

  void changeThemeName (String themeStr) {
    themeName = themeStr;
  }
  void changeTheme (String themeStr) async{
    themeName = themeStr;    
    theme = getTheme(themeStr);
    _themectrl.sink.add(theme);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeName', themeName);
  }
  dispose () {
    _themectrl.close();
  }
}

class BlocProvider extends InheritedWidget {
  final CustomThemeData ctheme = CustomThemeData();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CustomThemeData of(BuildContext context) => (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).ctheme;
}


ThemeObject getTheme (String name) {
  switch(name){
    case ThemeName.theme1: {
      return ThemeObject(backgroundColor: Colors.white, primaryColor: Colors.black);
    }
    case ThemeName.theme2:{
      return ThemeObject(backgroundColor: Color(0xff343442), primaryColor: Colors.white);
    }
  }
  return ThemeObject(backgroundColor: Colors.white, primaryColor: Colors.black);
}

Future<String> getThemeName () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('themeName') ?? 'Theme1';
}