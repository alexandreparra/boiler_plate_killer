import 'package:boiler_plate_killer/widgets/bpk_snack_bar.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showBpkSnackBar(BpkSnackBarModel snackBarModel) {
    ScaffoldMessenger.of(this)
        .showSnackBar(BpkSnackBar.fromModel(snackBarModel, this));
  }

  double height() => MediaQuery.of(this).size.height;

  double width() => MediaQuery.of(this).size.width;
}
