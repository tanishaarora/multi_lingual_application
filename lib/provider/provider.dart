import 'package:flutter/cupertino.dart';

class SetProvider extends ChangeNotifier {
  String? local;
  updateLocal(String lang) {
    local = lang;
    notifyListeners();
  }
}
