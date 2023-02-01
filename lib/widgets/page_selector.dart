import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/about/about_page.dart';
import '../pages/data_class/data_class_notifier.dart';
import '../pages/data_class/data_class_page.dart';

class PageSelector extends StatelessWidget {
  final int index;

  const PageSelector({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return ChangeNotifierProvider(
          create: (context) => DataClassNotifier(),
          child: const DataClassPage());
    } else if (index == 1) {
      return const AboutPage();
    }

    return const SizedBox.shrink();
  }
}
