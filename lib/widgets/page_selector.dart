import 'package:boiler_plate_killer/pages/entity_boilerplate/entity_boilerplate.dart';
import 'package:flutter/material.dart';

class PageSelector extends StatelessWidget {
  final int index;

  const PageSelector({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const EntityBoilerplate();
    }

    return const SizedBox.shrink();
  }
}
