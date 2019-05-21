
class ThemeName {
  static const theme1 = 'Theme1';
  static const theme2 = 'Theme2';
  static const theme3 = 'Theme3';
}
class CustomThemeData {
  String themeName;
  CustomThemeData({this.themeName = ThemeName.theme1});
}

var customThemeData = CustomThemeData();