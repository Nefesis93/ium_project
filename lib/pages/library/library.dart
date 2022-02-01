import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/appunti/home_lib_utility.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/utility/materie/materia.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  Widget _createBody(BuildContext context) {
    if (LibraryInfo().getState()) {
      //sto nel tab appunti caricati
      return ListView(
        children: <Widget>[
          //barra con appunti caricati e scaricati
          Row(
            children: <Widget>[
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
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
                width: MediaQuery.of(context).size.width / 2,
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
                      Navigator.of(context)
                          .push(CustomAnimations.flatAnimation(MyPage.library));
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
                    )),
              ),
            ],
          ),
          _getSearchBar(context),
          _getBody(context, true),
          //lista che contiene l'elenco degli appunti
          /*
          ListView(
            shrinkWrap: true,
            children: <Widget> [
              _getRowCaricati(context, Topic.lock),
              _getRowCaricati(context, Topic.basi),
            ]
          )
          */
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
                width: MediaQuery.of(context).size.width / 2,
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
                    Navigator.of(context)
                        .push(CustomAnimations.flatAnimation(MyPage.library));
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
                width: MediaQuery.of(context).size.width / 2,
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
                    )),
              )
            ],
          ),
          _getSearchBar(context),
          _getBody(context, false),
        ],
      );
    }
  }

  Widget _getBody(BuildContext context, bool caricati) {
    if (caricati) {
      List libCaricati = LibraryInfo().getCaricati();
      return ListView.builder(
        shrinkWrap: true,
        itemCount: libCaricati.length,
        itemBuilder: (BuildContext context, int i) {
          return _getRowCaricati(context, libCaricati[i]);
        },
      );
    } else {
      List libScaricati = LibraryInfo().getScaricati();
      return ListView.builder(
        shrinkWrap: true,
        itemCount: libScaricati.length,
        itemBuilder: (BuildContext context, int i) {
          return _getRowScaricati(context, libScaricati[i]);
        },
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
                        ))
                  ])),
        ]);
  }

  Widget _getRowCaricati(BuildContext context, Topic topic) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: Colors.blue),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
            HomeLibUtility.getTitle(context, topic),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Opacity(
                        opacity: (TopicToMateria().getMap()[topic] as Materia)
                                    .getVoto() >
                                0
                            ? 1
                            : 0.3,
                        child: const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                      ),
                      Opacity(
                        opacity: (TopicToMateria().getMap()[topic] as Materia)
                                    .getVoto() >
                                1
                            ? 1
                            : 0.3,
                        child: const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                      ),
                      Opacity(
                        opacity: (TopicToMateria().getMap()[topic] as Materia)
                                    .getVoto() >
                                2
                            ? 1
                            : 0.3,
                        child: const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                      ),
                      Opacity(
                        opacity: (TopicToMateria().getMap()[topic] as Materia)
                                    .getVoto() >
                                3
                            ? 1
                            : 0.3,
                        child: const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                      ),
                      Opacity(
                        opacity: (TopicToMateria().getMap()[topic] as Materia)
                                    .getVoto() >
                                4
                            ? 1
                            : 0.3,
                        child: const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
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
                        TopicInfo().setTopic(topic);
                        Navigator.push(context,
                            CustomAnimations.rightToLeft(MyPage.recensioni));
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
          ])),
    ]);
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
            ));
  }

  Widget _getSearchBar(BuildContext context) {
    return Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        child: const TextField(
            //controller: _emailController,
            //keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          counterText: "",
          suffixIcon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          labelText: "Trova tra i tuoi appunti",
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultBar(),
      floatingActionButton: const FloatingPlusButton(),
      body: _createBody(context),
    );
  }
}
