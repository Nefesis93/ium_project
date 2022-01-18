import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/informations/user_library.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  Widget createBody(BuildContext context) {
    if (MyLybrary().getState()) {
      //sto nel tab appunti caricati
      return Column(
        children: [
          //barra con appunti caricati e scaricati
          Row(
            children: <Widget>[
              Container(
                height: 40,
                width: 196,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () => 0,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  ),
                  child: const Text(
                    "Appunti Caricati",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 196,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    MyLybrary().appuntiScaricati();
                    Navigator.pop(context);
                    Navigator.of(context).push(MyAnimations.flatAnimation(MyPage.library));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                  ),
                  child: Text(
                    "Appunti Scaricati",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  )
                ),
              )
            ],
          ),
          //lista che contiene l'elenco dei file presenti AL MOMENTO NON FUNZIONA
          ListView(
            shrinkWrap: true,
            children: <Widget> [
              //prima riga della lista della view
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //bottoni con le scritte
                  Container(
                    height: 70,
                    width: 392,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () => 0,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(20, 15, 120, 10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Lock",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Sistemi Operativi",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: const <Icon>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                   Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                   Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                   Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                   Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                                //alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () => 0,
                                  child: const Text(
                                    "Visualizza Recensioni",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                    )
                  ),
                ]
              ),
            ]
          )
        ],
      );
    } else {
      //sto nel tab appunti scaricati
      return Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 40,
                width: 196,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    MyLybrary().appuntiCaricati();
                    Navigator.pop(context);
                    Navigator.of(context).push(MyAnimations.flatAnimation(MyPage.library));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  ),
                  child: Text(
                    "Appunti Caricati",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 196,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () => 0,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                  ),
                  child: const Text(
                    "Appunti Scaricati",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ),
              )
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //bottoni con le scritte
                  Container(
                    height: 70,
                    width: 392,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () => 0,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(20, 15, 60, 10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Processi di Sviluppo Ing.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Ingegneria del Software",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: IconButton(
                            onPressed: () {
                              MyDialogs.downloadCompleatedDialog(context);
                            },
                            icon: const Icon(
                              Icons.download_sharp,
                              color: Colors.blue,
                              size: 35,
                            ),
                          )
                        )
                      ]
                    )
                  ),
                ]
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultBar(
        title: "Libreria",
      ),
      bottomNavigationBar: const DefaultBottomBar(),
      floatingActionButton: const FloatingPlusButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: createBody(context),
    );
  }
}