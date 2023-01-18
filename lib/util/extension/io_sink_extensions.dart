import 'dart:io';

import 'package:boiler_plate_killer/util/extension/list_extensions.dart';

import '../bpk_constants.dart';

extension IoSinkExtension on IOSink {
  void writeDataClass(String dataClassName, List<String> fields) {
    final fieldNames = fields.takeFieldNames();

    write('class $dataClassName { ');
    for (String field in fields) {
      write('final $field; ');
    }

    write('const $dataClassName({');
    for (String field in fieldNames) {
      write('required this.$field,');
    }
    writeln('});');

    write(BpkConstants.equalsOverride);
    write(BpkConstants.openBracket);
    write(BpkConstants.equalsFirstCheck);
    write(BpkConstants.equalsSecondCheck(dataClassName));

    int i = 0;
    while (i != fieldNames.length - 1) {
      write(' other.${fieldNames[i]} == ${fieldNames[i]} &&');
      i++;
    }
    write('other.${fieldNames[i]} == ${fieldNames[i]};');
    write(BpkConstants.closeBracket);
    write(BpkConstants.hashCodeOverride);
    write(BpkConstants.openBracket);
    int j = 0;
    while (j != fieldNames.length - 1) {
      write(' ${fieldNames[j]}.hashCode ^ ');
      j++;
    }
    write(' ${fieldNames[j]}.hashCode;');
    write(BpkConstants.closeBracket);

    write(BpkConstants.closeBracket);
  }
}
