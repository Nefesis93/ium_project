import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_dialogs.dart';

class Lock extends StatelessWidget {
  const Lock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const DefaultBottomBar(),
        floatingActionButton: const FloatingPlusButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _getList(TopicInfo().getTopic(), context),
    );
  }

  Widget _getButton(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextButton(
        onPressed: () {
          if (UserLogin().getLoginInfo()) {
            //l'utente è loggato
            MyDialogs.downloadCompleatedDialog(context);
          } else {
            //l'utente non è loggato
            MyDialogs.permissionDialog(context);
          }
        },
        child: const Text(
          "Scarica",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25
          )
        )
      )
    );
  }

  Widget _getRecensioni(BuildContext context) {
    return Row();
  }

  Widget _getList(Topic topic, BuildContext context) {
    switch(topic) {
      case Topic.lock: {
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //titolo
              child: Column(
                children: <Widget>[
                  const Text(
                    "Lock",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    //riga contenente due colonne
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const <Widget>[
                              Text(
                                "Ingegneria del Software",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Facoltà di Informatica",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                  //bottone scarica
                  _getButton(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      height: 330,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset(
                                'assets/images/sincronizzazione1.png',
                                height: 300,
                              ),
                              iconSize: 320,
                              onPressed: () {
                                MyDialogs.chiarezzaDialog(context);
                              },
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/images/sincronizzazione2.png',
                                height: 300,
                              ),
                              iconSize: 320,
                              onPressed: () {
                                MyDialogs.chiarezzaDialog(context);
                              },
                            ),
                          ],
                        ) 
                      )
                    ),
                  ),
                  _getRecensioni(context),
                ],
              )
            )
          ]
        );
      }
      case Topic.algebra: {
        return Scaffold();
      }
    }
  }
}
