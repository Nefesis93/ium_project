import 'package:flutter/material.dart';
import 'package:ium_project/pages/appunti/appunti_utility.dart';

class Recensioni extends StatelessWidget {
  const Recensioni({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barra superiore
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Recensioni",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      //lista degli appunti
      body: ListView(
        shrinkWrap: true,
        children: <Widget> [
          AppuntiUtility.getRecensioni(context),
        ],
      ),
    );
  }
}