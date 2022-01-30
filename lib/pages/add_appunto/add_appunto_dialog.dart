import 'package:flutter/material.dart';
import 'package:ium_project/informations/library_info.dart';

/* 
classe che conterrà tutti i dialog utilizzati nella pagina di upload degli appunti
*/
class AddAppuntoDialogs {
  /*
  funzione che costruisce il dialog che conferma l'inserimento di un appunto
  */
  static void uploadDialog(BuildContext context) {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Upload completato",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Appunti caricati con successo",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              LibraryInfo().appuntiCaricati();
              Navigator.pushReplacementNamed(context, '/library');
            },
            child: const Text(
              "Vai alla Libreria",
              style: TextStyle(
                color: Colors.white
              )
            )
          )
        )
        ],
      )
    );
  }

  static void uploadErrorDialog(BuildContext context) {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Attenzione",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Devi prima compilare tutti i campi",
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