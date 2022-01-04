import 'package:flutter/material.dart';
import 'package:ium_project/bars.dart';
import 'package:ium_project/login_info.dart';

void main() {
  UserLogin user = UserLogin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUM Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        //barra superiore
        appBar: DefaultBar(),
        //barra inferiore
        bottomNavigationBar: DefaultBottomBar(),
        //più della barra inferiore
        floatingActionButton: FloatingPlusButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }
}