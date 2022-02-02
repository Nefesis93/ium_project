import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';

import 'add_appunto_dialog.dart';

/*
schermata di caricamento appunti
*/
class AddAppunto extends StatefulWidget {
  const AddAppunto({Key? key}) : super(key: key);

  @override
  _AddAppuntoState createState() => _AddAppuntoState();
}

class _AddAppuntoState extends State<AddAppunto> {
  final TextEditingController _titoloController = TextEditingController();
  final TextEditingController _facoltaController = TextEditingController();
  final TextEditingController _corsoController = TextEditingController();
  final TextEditingController _profController = TextEditingController();
  bool _fileCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CloseAppBar(
        title: "Carica Appunti",
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
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: const Text(
                      '*obbligatorio',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                                        children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18))
                                    ]))),
                            TextField(
                                controller: _titoloController,
                                maxLength: 25,
                                decoration: const InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(),
                                    //labelText: "Titolo",
                                    hintText:
                                        "Inserisci il titolo dei tuoi appunti"))
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
                                    children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18))
                                ]))),
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
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18))
                                  ]))),
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
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
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
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18))
                                  ]))),
                          TextField(
                              controller: _profController,
                              maxLength: 25,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(),
                                  //labelText: "Prof.",
                                  hintText: "Inserisci il cognome del Prof."))
                        ],
                      )),
                  Container(
                    height: _fileCheck ? 100 : 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _fileCheck = !_fileCheck;
                        });
                      },
                      child: _fileCheck
                          ? const Text("Inserisci un documento (.pdf)",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text("prototyping.pdf",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.attachment,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  Opacity(
                      opacity: _fileCheck ? 0 : 1,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blue,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Annulla",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.blue,
                                          )))),
                              Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                      onPressed: () {
                                        if (_titoloController.text != "" &&
                                            _facoltaController.text != '' &&
                                            _corsoController.text != '' &&
                                            _profController.text != '') {
                                          _titoloController.clear();
                                          _facoltaController.clear();
                                          _corsoController.clear();
                                          _profController.clear();
                                          LibraryInfo()
                                              .addCaricati(Topic.prototyping);
                                          Navigator.pop(context);
                                        } else {
                                          AddAppuntoDialogs.uploadErrorDialog(
                                              context);
                                        }
                                      },
                                      child: const Text("Carica",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          )))),
                            ],
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
