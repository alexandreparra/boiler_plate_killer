import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  double height() =>
      MediaQuery.of(this).size.height;

  double width() => MediaQuery.of(this).size.width;
}
