import 'package:flutter/material.dart';

import '../enum/app_navbar_enum.dart';

final class MainViewModel extends ChangeNotifier {
  AppNavBarEnum selectedIndex = AppNavBarEnum.home;

  void onItemTapped(AppNavBarEnum index) {
    selectedIndex = index;
    notifyListeners();
  }
}
