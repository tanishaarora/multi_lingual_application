import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static String? lang;

  static addLang(String language) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("lang", language);
  }

  static Future<String?> getLang() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    lang =sp.getString('lang');
    return lang;
  }
}