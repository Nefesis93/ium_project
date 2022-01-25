import 'package:flutter/material.dart';
import 'package:ium_project/utility/bars/bars.dart';

class Lock extends StatelessWidget {
  const Lock({Key? key}) : super(key: key);

  Widget createBody(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
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
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      "Valerio Mezzoprete",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Prof Tolomei",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ))
          ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const DefaultBottomBar(),
      floatingActionButton: const FloatingPlusButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: createBody(context),
    );
  }
}
