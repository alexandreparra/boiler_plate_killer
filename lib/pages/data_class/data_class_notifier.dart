import 'dart:io';

import 'package:boiler_plate_killer/config/config.dart';
import 'package:boiler_plate_killer/util/extension/io_sink_extensions.dart';
import 'package:boiler_plate_killer/util/extension/string_extensions.dart';
import 'package:boiler_plate_killer/util/style/bpk_colors.dart';
import 'package:boiler_plate_killer/widgets/bpk_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DataClassNotifier extends ChangeNotifier {
  bool _fieldsFlag = false;
  bool _classNameFlag = false;

  bool get generateDataClassFlag => _fieldsFlag && _classNameFlag;

  int _lineCount = 1;

  int get lineCount => _lineCount;

  // TODO this will be changed to a custom config later.
  List<String> classPostfixes = ["Model", "Entity", "Request", "Response", ""];
  String _selectedClassPostfix = "Model";

  void loadConfig() async {
    final config = await Config.load();
    classPostfixes = config.classPostfixes;
    notifyListeners();
  }

  void selectClassPostfix(String? input) {
    if (input != null) {
      _selectedClassPostfix = input;
    }
  }

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

  Future<BpkSnackBar> generateDataClass(BuildContext context,
      String dataClassName, String dataClassFields) async {
    final fields = dataClassFields.split('\n');

    final fieldsErr = _checkFieldErrors(context, fields);
    if (fieldsErr != null) return fieldsErr;

    final dataClassFileName =
        dataClassName.getDataClassFileName(_selectedClassPostfix);
    String? filePath = await FilePicker.platform
        .saveFile(dialogTitle: 'Saved file to:', fileName: dataClassFileName);

    if (filePath == null) {
      return BpkSnackBar(
        content: const Text('Cannot find the provided path'),
        backgroundColor: BpkColors.errorRed,
        context: context,
      );
    }

    final file = File(filePath);
    final ioSink = file.openWrite();
    ioSink.writeDataClass(dataClassName + _selectedClassPostfix, fields);
    ioSink.close();

    try {
      await Process.run('flutter', ['format', filePath]);
    } catch (e) {
      return BpkSnackBar(
        content: Text("Couldn't run flutter format on file at $filePath"),
        backgroundColor: BpkColors.errorRed,
        context: context,
      );
    }

    return BpkSnackBar(
      content: const Text('Successfully created and formatted file'),
      backgroundColor: BpkColors.successGreen,
      context: context,
    );
  }

  /// Check if there are any [fields] that do not present the following syntax:
  ///
  /// *type* *variable-name*
  ///
  /// Example: int age | String name
  BpkSnackBar? _checkFieldErrors(BuildContext context, List<String> fields) {
    for (int i = 0; i != fields.length; i++) {
      final words = fields[i].split(' ').where((e) => e.trim().isNotEmpty);
      if (words.length != 2) {
        _fieldsFlag = false;
        notifyListeners();

        return BpkSnackBar(
          content: Text('Malformed field at line ${i + 1}'),
          backgroundColor: BpkColors.errorRed,
          context: context,
        );
      }
    }

    return null;
  }
}
