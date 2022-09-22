import 'package:boiler_plate_killer/navigations.dart';
import 'package:boiler_plate_killer/pages/navigation/navigation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/page_selector.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(builder: (context, notifier, _) {
      return Row(
        children: [
          NavigationRail(
              destinations: navigationList,
              selectedIndex: notifier.currentIndex,
              onDestinationSelected: (int index) {
                notifier.changePage(index);
              }),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: PageSelector(index: notifier.currentIndex))
        ],
      );
    });
  }
}
