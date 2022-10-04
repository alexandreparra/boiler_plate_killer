extension StringExt on String {
  String getEntityFileName() =>
    '${replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), r'_').toLowerCase()}_entity.dart';
}