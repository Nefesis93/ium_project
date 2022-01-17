import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Impostazioni",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children:  <Widget>[
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: TextButton(
              onPressed: () => 0,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 20, 235, 20),
              ),
              child: const Text(
                "Cambia Password",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 60, 
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: TextButton(
              onPressed: () => 0,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 20, 279, 20),
              ),
              child: const Text(
                "Informazioni",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 60, 
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: TextButton(
              onPressed: () => 0,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 20, 348, 20),
              ),
              child: const Text(
                "Esci",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}