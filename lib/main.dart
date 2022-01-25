import 'package:flutter/material.dart';
import 'package:ium_project/pages/add_appunto/add_appunto.dart';
import 'package:ium_project/pages/add_recensione/add_recensione.dart';
import 'package:ium_project/pages/appunti/anteprime/notes_preview.dart';
import 'package:ium_project/pages/home/home.dart';
import 'package:ium_project/pages/library/library.dart';
import 'package:ium_project/pages/login/login.dart';
import 'package:ium_project/pages/pagina_appunto/lock.dart';
import 'package:ium_project/pages/recensioni/recensioni.dart';
import 'package:ium_project/pages/settings/settings.dart';
import 'package:ium_project/pages/settings_information/settings_information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUM Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //modificata la home per testare
      home: const Home(),
      //mappa che contiene il link a tutte le pagine
      routes: {
        '/home': (_) => const Home(),
        '/login': (_) => const LoginPage(),
        '/settings': (_) => const Settings(),
        '/settings_information': (_) => const SettingsInformation(),
        '/library': (_) => const Library(),
        '/add_appunto': (_) => const AddAppunto(),
        '/recensioni': (_) => const Recensioni(),
        '/add_recensione': (_) => const AddRecensione(),
        '/notes_preview': (_) => const NotesPreview(),
        '/lock': (_) => const Lock(),
      },
    );
  }
}
