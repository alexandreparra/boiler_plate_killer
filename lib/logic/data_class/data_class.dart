import 'dart:io';

import '../../util/platform_util.dart';
import 'data_class_errors.dart';
import 'data_class_util.dart';

class DataClassGen {
  DataClassGen._();

  static void _formatFile(String filePath) async {
    await Process.run('dart', ['format', filePath]);
  }

  static String getFileName(String dataClassName) {
    return dataClassName.getDataClassFileName();
  }

  static DataClassResult create(String dataClassName, String dataClassFields,
      String dataClassFileName, String filePath) {
    final fields = dataClassFields.split('\n');

    final fieldErrors = checkFieldErrors(fields);
    if (fieldErrors != null) {
      return DataClassFieldError(fieldErrors);
    }

    final file = File(filePath);
    final dataClassFileContents = writeDataClass(dataClassName, fields);
    file.writeAsString(dataClassFileContents);

    if (isDesktop()) {
      _formatFile(filePath);
    }

    return DataClassSuccess();
  }
}
