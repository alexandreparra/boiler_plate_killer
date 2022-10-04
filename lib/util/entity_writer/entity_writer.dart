import 'package:boiler_plate_killer/util/bpk_constants.dart';
import 'package:boiler_plate_killer/util/extension/list_extensions.dart';

String entityWriter(String entityClassName, List<String> fields) {
  final fieldNames = fields.takeFieldNames();
  final entityFile = StringBuffer();

  entityFile.write('class $entityClassName { ');
  for (String field in fields) {
    entityFile.write('final $field; ');
  }

  entityFile.write('const $entityClassName({');
  entityFile.writeAll(fields.toRequiredParameters());
  entityFile.write('}); ');

  entityFile.write(BpkConstants.equalsOverride);
  entityFile.write(BpkConstants.openBracket);
  entityFile.write(BpkConstants.equalsFirstCheck);
  entityFile.write('return other is $entityClassName &&');
  int i = 0;
  while (i != fieldNames.length - 1) {
    entityFile.write(' other.${fieldNames[i]} == ${fieldNames[i]} &&');
    i++;
  }
  entityFile.write('other.${fieldNames[i]} == ${fieldNames[i]};');
  entityFile.write(BpkConstants.closeBracket);

  entityFile.write(BpkConstants.hashCodeOverride);
  entityFile.write(BpkConstants.openBracket);
  int j = 0;
  while (j != fieldNames.length - 1) {
    entityFile.write(' ${fieldNames[j]}.hashCode ^ ');
    j++;
  }
  entityFile.write(' ${fieldNames[j]}.hashCode;');
  entityFile.write(BpkConstants.closeBracket);

  entityFile.write(BpkConstants.closeBracket);

  return entityFile.toString();
}
