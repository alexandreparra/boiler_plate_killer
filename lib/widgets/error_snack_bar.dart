import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {
  const ErrorSnackBar(
      {super.key,
      required super.content,
      super.action,
      super.backgroundColor = Colors.redAccent,
      super.behavior = SnackBarBehavior.floating,
      super.margin});
}
