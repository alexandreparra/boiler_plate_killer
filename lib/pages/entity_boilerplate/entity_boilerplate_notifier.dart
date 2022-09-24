import 'package:flutter/material.dart';

class EntityBoilerplateNotifier extends ChangeNotifier {
  bool _fieldsFlag = false;
  bool _classNameFlag = false;

  bool get generateEntityFlag => _fieldsFlag && _classNameFlag;

  int _lineCount = 1;

  int get lineCount => _lineCount;

  void checkClassName(String input) {
    input.trim().isNotEmpty ? _classNameFlag = true : _classNameFlag = false;
    notifyListeners();
  }

  void checkFieldsLength(String input) {
    if (input.trim().isNotEmpty) {
      _fieldsFlag = true;
      _countLines(input);
    } else {
      _fieldsFlag = false;
    }

    notifyListeners();
  }

  void _countLines(String input) {
    final breakRegex = RegExp('^', multiLine: true);
    final lines = breakRegex.allMatches(input);
    if (lines.isNotEmpty) {
      _lineCount = lines.length;
      notifyListeners();
    }
  }

  void generateEntity(String entityName, String entityFields) {}
}
