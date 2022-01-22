import 'package:flutter/material.dart';
import 'package:ium_project/pages/home/home.dart';
import 'package:ium_project/pages/library/library.dart';
import 'package:ium_project/pages/login/login.dart';
import 'package:ium_project/pages/recensioni/recensioni.dart';
import 'package:ium_project/pages/settings/settings.dart';
import 'package:ium_project/pages/settings_information/settings_information.dart';
import 'package:ium_project/pages/upload/upload.dart';

class MyPage {
  final Widget _page;

  const MyPage._(this._page);

  Widget getInstance() {
    return _page;
  }

  static const MyPage home = MyPage._(Home());
  static const MyPage library = MyPage._(Library());
  static const MyPage login = MyPage._(LoginPage());
  static const MyPage upload = MyPage._(UploadPage());
  static const MyPage settings = MyPage._(Settings());
  static const MyPage settingsInformation = MyPage._(SettingsInformation());
  static const MyPage recensioni = MyPage._(Recensioni());
}