import 'package:boiler_plate_killer/widgets/bpk_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../logic/data_class/data_class.dart';
import '../../logic/data_class/data_class_errors.dart';

class DataClassNotifier extends ChangeNotifier {
  bool _fieldsFlag = false;
  bool _classNameFlag = false;
  bool get canGenerateDataClass => _fieldsFlag && _classNameFlag;

  int _lineCount = 1;
  int get lineCount => _lineCount;

  BpkSnackBarModel? snackBar;

  void checkClassName(String? input) {
    if (input != null) {
      input.trim().isNotEmpty ? _classNameFlag = true : _classNameFlag = false;
      notifyListeners();
    }
  }

  void checkFieldsLength(String input) {
    if (input.trim().isNotEmpty) {
      _fieldsFlag = true;
    } else {
      _fieldsFlag = false;
    }

    _countLines(input);
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

  Future<void> generateDataClass(
      String dataClassName, String dataClassFields) async {
    final dataClassFileName = DataClassGen.getFileName(dataClassName);

    String? filePath = await FilePicker.platform
        .saveFile(dialogTitle: 'Save file to:', fileName: dataClassFileName);

    if (filePath == null) {
      snackBar = BpkSnackBarModel("Path $filePath not found", Colors.red);
      return;
    }

    final result = DataClassGen.create(
        dataClassName, dataClassFields, dataClassFileName, filePath);

    switch (result) {
      case DataClassSuccess():
        snackBar =
            BpkSnackBarModel("File generated successfully", Colors.green);
      case DataClassFieldError(errorPositions: var errors):
        // Unused for now
      case FilePathError():
        snackBar = BpkSnackBarModel("Path $filePath not found", Colors.red);
    }

    notifyListeners();
  }
}
