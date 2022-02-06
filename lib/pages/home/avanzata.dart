import 'package:flutter/material.dart';
import 'package:ium_project/enums/filters.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/search_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/materie/materia.dart';

/*
schermata di caricamento appunti
*/
class RicercaAvanzata extends StatefulWidget {
  const RicercaAvanzata({Key? key}) : super(key: key);

  @override
  _RicercaAvanzataState createState() => _RicercaAvanzataState();
}

class _RicercaAvanzataState extends State<RicercaAvanzata> {
  final TextEditingController _titoloController = TextEditingController();
  final TextEditingController _facoltaController = TextEditingController();
  final TextEditingController _corsoController = TextEditingController();
  final TextEditingController _profController = TextEditingController();
  final TextEditingController _autoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CloseAppBar(
        title: "Ricerca Avanzata",
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 400,
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                            width: 240,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(30)),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: const Text(
                              "Inserire uno o più campi di ricerca",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue),
                            )))
                  ]),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: RichText(
                                    text: const TextSpan(
                                  text: "Titolo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue,
                                      fontSize: 18),
                                ))),
                            TextField(
                                controller: _titoloController,
                                maxLength: 25,
                                decoration: const InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(),
                                    //labelText: "Titolo",
                                    hintText: "Inserisci il titolo"))
                          ])),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: RichText(
                                text: const TextSpan(
                              text: "Facoltà",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue,
                                  fontSize: 18),
                            ))),
                        TextField(
                            controller: _facoltaController,
                            maxLength: 25,
                            decoration: const InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                                //labelText: "Facoltà",
                                hintText: "Inserisci la facoltà")),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: RichText(
                                  text: const TextSpan(
                                text: "Corso",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                    fontSize: 18),
                              ))),
                          TextField(
                              controller: _corsoController,
                              maxLength: 25,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(),
                                  //labelText: "Facoltà",
                                  hintText: "Inserisci il corso")),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: RichText(
                                  text: const TextSpan(
                                text: "Prof",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                    fontSize: 18),
                              ))),
                          TextField(
                              controller: _profController,
                              maxLength: 25,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(),
                                  //labelText: "Prof.",
                                  hintText: "Inserisci il cognome del prof."))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: RichText(
                                  text: const TextSpan(
                                text: "Autore",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                    fontSize: 18),
                              ))),
                          TextField(
                              controller: _autoreController,
                              maxLength: 25,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(),
                                  //labelText: "Prof.",
                                  hintText: "Inserisci l'autore"))
                        ],
                      )),
                  Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            if (_titoloController.text == "" &&
                                _facoltaController.text == '' &&
                                _corsoController.text == '' &&
                                _profController.text == '' &&
                                _autoreController.text == "") {
                              CustomDialogs.searchDialog(context);
                            } else {
                              String titolo = _titoloController.text;
                              String facolta = _facoltaController.text;
                              String corso = _corsoController.text;
                              String prof = _profController.text;
                              String autore = _autoreController.text;
                              _titoloController.clear();
                              _facoltaController.clear();
                              _corsoController.clear();
                              _profController.clear();
                              _autoreController.clear();
                              _multiFilterSearch(Filters.none, autore, corso,
                                  facolta, prof, titolo);
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  CustomAnimations.topToBottom(
                                      MyPage.risultati));
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text("Cerca",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ))),
                                Icon(Icons.search, color: Colors.white)
                              ])))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void _multiFilterSearch(Filters filter, String autoreA, String corsoA,
      String facoltaA, String profA, String titoloA) {
    SearchInfo().setFilter(Filters.avanzata);
    for (Topic t in Topic.values) {
      Materia materia = TopicToMateria().getMap()[t];
      if (materia
              .getPublisher()
              .toLowerCase()
              .contains(autoreA.toLowerCase()) &&
          materia.getTopic().toLowerCase().contains(corsoA.toLowerCase()) &&
          materia
              .getDepartment()
              .toLowerCase()
              .contains(facoltaA.toLowerCase()) &&
          materia.getTeacher().toLowerCase().contains(profA.toLowerCase()) &&
          materia.getTitle().toLowerCase().contains(titoloA.toLowerCase())) {
        SearchInfo().addRisultato(t);
      }
    }
  }
}
