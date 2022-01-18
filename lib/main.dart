import 'package:flutter/material.dart';
import 'package:ium_project/utility/bars/bars.dart';

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
      home: const Scaffold(
        //barra superiore
        appBar: DefaultBar(
          title: "Home",
        ),
        //barra inferiore
        bottomNavigationBar: DefaultBottomBar(),
        //più della barra inferiore
        floatingActionButton: FloatingPlusButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }
}