import 'package:flutter/material.dart';
import 'package:ium_project/utility/bars/bars.dart';

class Lock extends StatelessWidget {
  const Lock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const DefaultBottomBar(),
        floatingActionButton: const FloatingPlusButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView(shrinkWrap: true, children: <Widget>[
          Container(
              height: 90,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  "Lock",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                  ),
                ),
              )),
          //riga contenente due colonne
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      "Valerio Mezzoprete",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Prof. Tolomei",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ])
        ]));
  }
}
