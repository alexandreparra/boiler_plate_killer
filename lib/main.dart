import 'package:boiler_plate_killer/pages/navigation/navigation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/navigation/navigation_page.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider(
          create: (context) => NavigationNotifier(),
          child: const NavigationPage())));
}
