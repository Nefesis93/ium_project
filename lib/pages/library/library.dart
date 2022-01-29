import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/utility/appunti/home_lib_utility.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/informations/library_info.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  Widget createBody(BuildContext context) {
    if (LibraryInfo().getState()) {
      //sto nel tab appunti caricati
      return ListView(
        children: <Widget>[
          //barra con appunti caricati e scaricati
          Row(
            children: <Widget>[
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
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
                    alignment: Alignment.center,
                    minimumSize: const Size.fromWidth(double.infinity),
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
                width: MediaQuery.of(context).size.width/2,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    LibraryInfo().appuntiScaricati();
                    Navigator.pop(context);
                    Navigator.of(context).push(CustomAnimations.flatAnimation(MyPage.library));
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    minimumSize: const Size.fromWidth(double.infinity),
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
          //lista che contiene l'elenco degli appunti
          ListView(
            shrinkWrap: true,
            children: <Widget> [
              //prima riga della lista della view
              _getRowCaricati(context, Topic.lock),
              _getRowCaricati(context, Topic.basi),
            ]
          )
        ],
      );
    } else {
      //sto nel tab appunti scaricati
      return Column(
        children: [
          //barra con appunti caricati e scaricati
          Row(
            children: <Widget>[
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    LibraryInfo().appuntiCaricati();
                    Navigator.pop(context);
                    Navigator.of(context).push(CustomAnimations.flatAnimation(MyPage.library));
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    minimumSize: const Size.fromWidth(double.infinity),
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
                width: MediaQuery.of(context).size.width/2,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: TextButton(
                  onPressed: () => 0,
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    minimumSize: const Size.fromWidth(double.infinity),
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
              _getRowScaricati(context, Topic.pdsi),
            ],
          ),
        ],
      );
    }
  }

  Widget _getRowScaricati(BuildContext context, Topic topic) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: Colors.blue),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              HomeLibUtility.getTitle(context, topic),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                  onPressed: () {
                    _downloadCompleatedDialog(context);
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
    );
  }


  Widget _getRowCaricati(BuildContext context, Topic topic) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: Colors.blue),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              HomeLibUtility.getTitle(context, topic),
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/recensioni');
                        },
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
    );
  }

  void _downloadCompleatedDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Download Completato",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Appunti scaricati con successo",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("ok"),
          ),
        ],
      )
    );
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