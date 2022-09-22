import 'package:flutter/cupertino.dart';

class NavigationNotifier extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changePage(int pageIndex) {
    _currentIndex = pageIndex;
    notifyListeners();
  }
}
