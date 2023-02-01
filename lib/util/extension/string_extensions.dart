extension StringExt on String {
  String getDataClassFileName(String classTermination) {
    if (classTermination.isNotEmpty) {
      return '${replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), r'_').toLowerCase()}_${classTermination.toLowerCase()}.dart';
    } else {
      return '${replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), r'_').toLowerCase()}.dart';
    }
  }
}
