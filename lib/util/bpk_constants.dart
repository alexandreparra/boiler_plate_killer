class BpkConstants {
  BpkConstants._();

  static const String openBracket = '{';
  static const String closeBracket = '}';
  static const String semiColon = ';';
  static const String equalsOverride =
      '@override bool operator ==(Object other)';
  static const String equalsFirstCheck =
      'if (identical(this, other)) return true;';
  static const String hashCodeOverride = '@override int get hashCode';
}
