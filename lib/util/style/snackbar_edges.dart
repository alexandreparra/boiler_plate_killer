import 'package:boiler_plate_killer/util/extension/context_extensions.dart';
import 'package:flutter/cupertino.dart';

EdgeInsets snackBarInsets(BuildContext context) {
  return EdgeInsets.only(
      bottom: context.height() - 100, right: 20, left: context.width() * 0.5);
}
