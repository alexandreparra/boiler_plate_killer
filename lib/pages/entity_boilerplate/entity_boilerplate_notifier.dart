import 'package:flutter/material.dart';

class EntityBoilerplateNotifier extends ChangeNotifier {
  bool _generateEntityFlag = false;

  bool get generateEntityFlag => _generateEntityFlag;

  int _lineCount = 1;

  int get lineCount => _lineCount;

  void checkStringLength(String input) {
    if (input.trim().isNotEmpty) {
      _generateEntityFlag = true;
      _countLines(input);
    } else {
      _generateEntityFlag = false;
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

  void generateEntity(String entity) {}
}
