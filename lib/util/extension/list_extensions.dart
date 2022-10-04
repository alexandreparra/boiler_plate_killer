extension ListExt on List<String> {
  List<String> takeFieldNames() => map((e) => e.split(' ')[1]).toList();
}
