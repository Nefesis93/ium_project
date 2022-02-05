import 'package:flutter/material.dart';
import 'package:ium_project/enums/home_query.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/query_state.dart';
import 'package:ium_project/informations/topic_to_home_query.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/utility/custom_dialogs.dart';

class Search {
  static final TextEditingController _titoloController =
      TextEditingController();
  static final TextEditingController _facoltaController =
      TextEditingController();
  static final TextEditingController _corsoController = TextEditingController();
  static final TextEditingController _profController = TextEditingController();
  static final TextEditingController _autoreController =
      TextEditingController();

  static void searchDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              //colonna che conterrà tutti i parametri di ricerca
              actionsAlignment: MainAxisAlignment.end,
              elevation: 0,
              alignment: Alignment.topRight,
              insetPadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.blue,
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(children: <Widget>[
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                      Container(
                          width: 335,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Row(children: <Widget>[
                            TextButton(
                                onPressed: () => 0,
                                child: const Text("Cerca...",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)))
                          ]))
                    ]),
                    //riga Titolo`
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _getContainerSearch(context, "Titolo", true),
                        _getContainerSearch(context, "Facoltà", true),
                        _getContainerSearch(context, "Corso", true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _getContainerSearch(context, "Prof", true),
                        _getContainerSearch(context, "Autore", true),
                        _getContainerSearch(context, "Ricerca avanzata", false),
                      ],
                    ),
                    /*Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(30)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_corsoController.text == '' &&
                              _autoreController.text == '' &&
                              _facoltaController.text == '' &&
                              _profController.text == '' &&
                              _titoloController.text == '') {
                            CustomDialogs.searchDialog(context);
                          }
                          String corso = _corsoController.text.toLowerCase();
                          for (Topic t in Topic.values) {
                            if (t.name == corso) {
                              _corsoController.clear();
                              _autoreController.clear();
                              _corsoController.clear();
                              _facoltaController.clear();
                              _titoloController.clear();
                              QueryState()
                                  .setState(TopicToHomeQuery().getMap()[t]);
                              Navigator.pop(context);
                              Navigator.pushReplacement(context,
                                  CustomAnimations.flatAnimation(MyPage.home));
                            }
                          }
                          if (_facoltaController.text.toLowerCase() ==
                              'informatica') {
                            _corsoController.clear();
                            _autoreController.clear();
                            _corsoController.clear();
                            _facoltaController.clear();
                            _titoloController.clear();
                            QueryState().setState(HomeQuery.facolta);
                            Navigator.pop(context);
                            Navigator.pushReplacement(context,
                                CustomAnimations.flatAnimation(MyPage.home));
                          }

                          if (_titoloController.text
                              .toLowerCase()
                              .contains('lock')) {
                            _corsoController.clear();
                            _autoreController.clear();
                            _corsoController.clear();
                            _facoltaController.clear();
                            _titoloController.clear();
                            QueryState().setState(HomeQuery.locks);
                            Navigator.pop(context);
                            Navigator.pushReplacement(context,
                                CustomAnimations.flatAnimation(MyPage.home));
                          }
                          if (_profController.text.toLowerCase() ==
                              'de marsico') {
                            _corsoController.clear();
                            _autoreController.clear();
                            _corsoController.clear();
                            _facoltaController.clear();
                            _titoloController.clear();
                            QueryState().setState(HomeQuery.basiProf);
                            Navigator.pop(context);
                            Navigator.pushReplacement(context,
                                CustomAnimations.flatAnimation(MyPage.home));
                          }

                          if (_autoreController.text.toLowerCase() ==
                              'king bradley') {
                            _corsoController.clear();
                            _autoreController.clear();
                            _corsoController.clear();
                            _facoltaController.clear();
                            _titoloController.clear();
                            QueryState().setState(HomeQuery.automi);
                            Navigator.pop(context);
                            Navigator.pushReplacement(context,
                                CustomAnimations.flatAnimation(MyPage.home));
                          }
                        },
                        child: const Text(
                          'Cerca',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
            ));
  }

  static Widget _getContainerSearch(
      BuildContext context, String text, bool plus) {
    return Container(
        width: 115,
        height: 47,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue,
            ),
            color: Colors.white),
        child: Row(
            mainAxisAlignment:
                plus ? MainAxisAlignment.center : MainAxisAlignment.end,
            children: <Widget>[
              getIcon(plus),
              SizedBox(
                  width: 80,
                  child: TextButton(
                      onPressed: () => 0,
                      child: Text(text,
                          style: TextStyle(
                              fontSize: plus ? 19 : 12, color: Colors.blue))))
            ]));
  }

  static Widget getIcon(bool plus) {
    if (!plus) {
      return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "+",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ));
    } else {
      return const SizedBox();
    }
  }

  /*
  funzione che genera la riga con il testo e l'input box
  */
  static Widget _getInputRow(
      BuildContext context, String text, TextEditingController controller) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
        border: Border.all(color: Colors.black),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: 240,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
