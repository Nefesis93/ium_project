import 'package:flutter/material.dart';
import 'package:ium_project/pages/add_appunto/add_appunto.dart';
import 'package:ium_project/pages/add_recensione/add_recensione.dart';
import 'package:ium_project/pages/appunti/anteprime/notes_preview.dart';
import 'package:ium_project/pages/home/home.dart';
import 'package:ium_project/pages/library/library.dart';
import 'package:ium_project/pages/login/login.dart';
import 'package:ium_project/pages/recensioni/recensioni.dart';
import 'package:ium_project/pages/settings/settings.dart';
import 'package:ium_project/pages/settings_information/settings_information.dart';
import 'package:ium_project/pages/appunti/pagina_appunti/appunti.dart';

class MyPage {
  final Widget _page;

  const MyPage._(this._page);

  Widget getInstance() {
    return _page;
  }

  static const MyPage home = MyPage._(Home());
  static const MyPage library = MyPage._(Library());
  static const MyPage login = MyPage._(LoginPage());
  static const MyPage addAppunto = MyPage._(AddAppunto());
  static const MyPage settings = MyPage._(Settings());
  static const MyPage settingsInformation = MyPage._(SettingsInformation());
  static const MyPage recensioni = MyPage._(Recensioni());
  static const MyPage addRecensione = MyPage._(AddRecensione());
  static const MyPage appunti = MyPage._(Appunti());
  static const MyPage notesPreview = MyPage._(NotesPreview());
}