import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxController {
  final _theme = GetStorage();
  final _key = 'isDarkMode';

  _saveTheme(bool isDarkMode) => _theme.write(_key, isDarkMode);
  bool _loadTheme() => _theme.read(_key) ?? false;

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
    _saveTheme(!_loadTheme());
  }
}
