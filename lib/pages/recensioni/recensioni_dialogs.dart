import 'package:flutter/material.dart';

/*
classe che conterrà tutti i dialog utilizzati sulla pagina recensioni
*/
class RecensioniDialogs {
  /*
  funzione che costruisce il dialog chiede spiega cos'é la chiarezza
  */
  static void chiarezzaDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Chiarezza",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "La chiarezza esplrime quanto sono di facile comprensione gli appunti",
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

  /*
  funzione che costruisce il dialog chiede spiega cos'é la validitá
  */
  static void validitaDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Validitá",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "La validitá esprime quanto sono utili gli appunti ai fini dell'apprendimento e del superamento dell'esame",
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

  /*
  funzione che costruisce il dialog chiede spiega cos'é la completeza
  */
  static void completezzaDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Completezza",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "La completezza esprime quanto è buono il rapporto tra sintesi e argomenti coperti",
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
}