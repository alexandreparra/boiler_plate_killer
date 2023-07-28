sealed class DataClassResult {}

class DataClassSuccess implements DataClassResult {}

// TODO unused for now
class DataClassFieldError implements DataClassResult {
  final List<int> errorPositions;
  DataClassFieldError(this.errorPositions);
}

class FilePathError implements DataClassResult {}

