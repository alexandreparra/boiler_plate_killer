import 'package:boiler_plate_killer/util/style/bpk_colors.dart';
import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {

  const ErrorSnackBar({super.key,
    super.backgroundColor = BpkColors.errorRed,
    required super.content,
    super.action,
    super.behavior = SnackBarBehavior.floating,
    super.margin});
}
