import 'package:flutter/material.dart';

class BpkSnackBarModel {
  final String content;
  final Color? backgroundColor;

  BpkSnackBarModel(this.content, this.backgroundColor);
}

class BpkSnackBar extends SnackBar {
  const BpkSnackBar({
    super.key,
    required BuildContext context,
    super.backgroundColor,
    required super.content,
    super.action,
  });

  BpkSnackBar.fromModel(BpkSnackBarModel model, BuildContext context,
      {super.key})
      : super(content: Text(model.content), backgroundColor: model.backgroundColor);
}
