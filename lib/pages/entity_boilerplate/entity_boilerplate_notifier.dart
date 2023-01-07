import 'dart:io';

import 'package:boiler_plate_killer/util/entity_writer/entity_writer.dart';
import 'package:boiler_plate_killer/util/extension/string_extensions.dart';
import 'package:boiler_plate_killer/util/style/bpk_colors.dart';
import 'package:boiler_plate_killer/widgets/bpk_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
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

  Future<BpkSnackBar> generateEntity(
      BuildContext context, String entityName, String entityFields) async {
    final fields = entityFields.split('\n');

    // Check errors
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

    final entityClassName = entityName.getEntityFileName();
    String? filePath = await FilePicker.platform
        .saveFile(dialogTitle: 'Save file to:', fileName: entityClassName);

    if (filePath == null) {
      return BpkSnackBar(
        content: const Text('Cannot find the provided path'),
        backgroundColor: BpkColors.errorRed,
        context: context,
      );
    }

    final file = File(filePath);

    file.writeAsString(entityWriter(entityName, fields));
    await Process.run('flutter', ['format', filePath]);

    return BpkSnackBar(
      content: const Text('Successfully created and formatted file'),
      backgroundColor: BpkColors.successGreen,
      context: context,
    );
  }
}
