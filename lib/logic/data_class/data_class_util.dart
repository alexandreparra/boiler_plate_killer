import '../bpk_constants.dart';

extension ListExt on List<String> {
  List<String> takeFieldNames() => map((e) => e.split(' ')[1]).toList();
}

extension StringExt on String {
  String getDataClassFileName() {
    return '${replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), r'_').toLowerCase()}.dart';
  }
}

List<int>? checkFieldErrors(List<String> fields) {
  List<int> errors = [];

  for (int i = 0; i != fields.length; i++) {
    final words = fields[i].split(' ').where((e) => e.trim().isNotEmpty);
    if (words.length != 2) {
      errors.add(i + 1);
    }
  }

  if (errors.isEmpty) return null;

  return errors;
}

String writeDataClass(String dataClassName, List<String> fields) {
  final fieldNames = fields.takeFieldNames();
  final file = StringBuffer();

  file.write('class $dataClassName { ');
  for (String field in fields) {
    file.write('final $field; ');
  }

  file.write('const $dataClassName ({');
  int i = 0;
  while (i != fieldNames.length - 1) {
    file.write('required this.${fieldNames[i]},');
    i++;
  }
  file.write('required this.${fieldNames[i]}');
  file.writeln('}); ');

  // bool operator ==
  file.write(BpkConstants.equalsOverride);
  file.write(BpkConstants.openBracket);
  file.write(BpkConstants.equalsFirstCheck);
  file.write(BpkConstants.equalsSecondCheck(dataClassName));

  i = 0;
  while (i != fieldNames.length - 1) {
    file.write(' other.${fieldNames[i]} == ${fieldNames[i]} && ');
    i++;
  }
  file.write('other.${fieldNames[i]} == ${fieldNames[i]};');
  file.write(BpkConstants.closeBracket);

  // int get hasCode
  file.write(BpkConstants.hashCodeOverride);

  int j = 0;
  while (j != fieldNames.length - 1) {
    file.write(' ${fieldNames[j]}.hashCode ^ ');
    j++;
  }
  file.write(' ${fieldNames[j]}.hashCode;');

  file.write(BpkConstants.closeBracket);
  return file.toString();
}
