import 'package:flutter/material.dart';
import 'package:ium_project/enums/filters.dart';
import 'package:ium_project/enums/home_query.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/informations/query_state.dart';
import 'package:ium_project/informations/search_info.dart';
import 'package:ium_project/informations/topic_to_home_query.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/materie/materia.dart';

class Search {
  static final TextEditingController _titoloController =
      TextEditingController();
  static final TextEditingController _facoltaController =
      TextEditingController();
  static final TextEditingController _corsoController = TextEditingController();
  static final TextEditingController _profController = TextEditingController();
  static final TextEditingController _autoreController =
      TextEditingController();
  static final TextEditingController _noneController = TextEditingController();

  static void searchDialog(BuildContext context, Filters filter) {
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
                height: filter != Filters.none ? 110 : 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    getSearchBar(context, filter),
                    //riga Titolo`
                    filter == Filters.none
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _getContainerSearch(
                                  context, Filters.titolo, true),
                              _getContainerSearch(
                                  context, Filters.facolta, true),
                              _getContainerSearch(context, Filters.corso, true),
                            ],
                          )
                        : const SizedBox(),
                    filter == Filters.none
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _getContainerSearch(context, Filters.prof, true),
                              _getContainerSearch(
                                  context, Filters.autore, true),
                              _getContainerSearch(
                                  context, Filters.avanzata, false),
                            ],
                          )
                        : const SizedBox(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700,
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(30)),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: TextButton(
                              child: const Text(
                                "Cerca",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
                                if (_titoloController.text != "" ||
                                    _autoreController.text != "" ||
                                    _corsoController.text != "" ||
                                    _profController.text != "" ||
                                    _noneController.text != "") {
                                  if (filter == Filters.none) {
                                    //ricerca su tutto
                                    multiFilterSearch(
                                        filter, _noneController.text);
                                    _corsoController.clear();
                                    _autoreController.clear();
                                    _facoltaController.clear();
                                    _profController.clear();
                                    _titoloController.clear();
                                    SearchInfo().setFilter(filter);
                                    Navigator.pushReplacement(
                                        context,
                                        CustomAnimations.rightToLeft(
                                            MyPage.risultati));
                                  } else {
                                    //switch context per andare alla pagina dei risultati
                                    //ricerca su un filtro
                                    singleFilterSearch(
                                        filter,
                                        _autoreController.text,
                                        _corsoController.text,
                                        _facoltaController.text,
                                        _profController.text,
                                        _titoloController.text);
                                    _corsoController.clear();
                                    _autoreController.clear();
                                    _facoltaController.clear();
                                    _profController.clear();
                                    _titoloController.clear();
                                    SearchInfo().setFilter(filter);
                                    Navigator.pushReplacement(
                                        context,
                                        CustomAnimations.rightToLeft(
                                            MyPage.risultati));
                                  }
                                }
                              },
                            )))
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

  static void multiFilterSearch(Filters filter, String noneA) {
    for (Topic t in Topic.values) {
      Materia materia = TopicToMateria().getMap()[t];
      if (materia.getPublisher().toLowerCase().contains(noneA.toLowerCase()) ||
          materia.getTopic().toLowerCase().contains(noneA.toLowerCase()) ||
          materia.getDepartment().toLowerCase().contains(noneA.toLowerCase()) ||
          materia.getTeacher().toLowerCase().contains(noneA.toLowerCase()) ||
          materia.getTitle().toLowerCase().contains(noneA.toLowerCase())) {
        SearchInfo().addRisultato(t);
      }
    }
  }

  static void singleFilterSearch(Filters filter, String autoreA, String corsoA,
      String facoltaA, String profA, String titoloA) {
    for (Topic t in Topic.values) {
      Materia materia = TopicToMateria().getMap()[t];
      switch (filter) {
        case Filters.autore:
          {
            if (materia
                .getPublisher()
                .toLowerCase()
                .contains(autoreA.toLowerCase())) {
              SearchInfo().addRisultato(t);
            }
          }
          break;
        case Filters.corso:
          {
            if (materia
                .getTopic()
                .toLowerCase()
                .contains(corsoA.toLowerCase())) {
              SearchInfo().addRisultato(t);
            }
          }
          break;
        case Filters.facolta:
          {
            if (materia
                .getDepartment()
                .toLowerCase()
                .contains(facoltaA.toLowerCase())) {
              SearchInfo().addRisultato(t);
            }
          }
          break;
        case Filters.prof:
          {
            if (materia
                .getTeacher()
                .toLowerCase()
                .contains(profA.toLowerCase())) {
              SearchInfo().addRisultato(t);
            }
          }
          break;
        case Filters.titolo:
          {
            if (materia
                .getTitle()
                .toLowerCase()
                .contains(titoloA.toLowerCase())) {
              SearchInfo().addRisultato(t);
            }
          }
          break;
        default:
          {}
          break;
      }
    }
  }

  static Widget _getContainerSearch(
      BuildContext context, Filters filter, bool plus) {
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
                      onPressed: () {
                        Navigator.pop(context);
                        if (filter == Filters.avanzata) {
                          Navigator.pushNamed(context, "/avanzata");
                        } else {
                          searchDialog(context, filter);
                        }
                      },
                      child: Text(
                          filter == Filters.avanzata
                              ? "Ricerca Avanzata"
                              : _upperFirstChar(filter.toString().substring(8)),
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

  static Widget getSearchBar(BuildContext context, Filters filter) {
    return Row(children: <Widget>[
      IconButton(
          onPressed: () {
            SearchInfo().clearRisultato();
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
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            filter != Filters.none
                ? _getContainerSearch(
                    context, filter, filter == Filters.avanzata ? false : true)
                : const SizedBox(),
            Container(
                padding: const EdgeInsets.only(left: 15),
                height: 50,
                width: filter == Filters.none ? 280 : 170,
                child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    controller: _getController(filter),
                    maxLength: 25,
                    decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        hintText: "Cerca..."))),
            filter != Filters.none
                ? Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                        onPressed: () {
                          SearchInfo().clearRisultato();
                          Navigator.pop(context);
                          searchDialog(context, Filters.none);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )))
                : const SizedBox()
          ]))
    ]);
  }

  static TextEditingController _getController(Filters filter) {
    switch (filter) {
      case Filters.autore:
        return _autoreController;
      case Filters.corso:
        return _corsoController;
      case Filters.facolta:
        return _facoltaController;
      case Filters.titolo:
        return _titoloController;
      case Filters.prof:
        return _profController;
      case Filters.none:
        return _noneController;
      default:
        return TextEditingController();
    }
  }

  static String _upperFirstChar(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }
}
