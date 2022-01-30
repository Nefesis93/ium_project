import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/utility/custom_animations.dart';

/*
classe che conterrà tutti i dialog utilizzati su più di una pagina
*/
class CustomDialogs {
  /*
  funzione che crea il pop-up che impedisce agli utenti non loggati di accedere a funzioni riservate a utenti loggati
  */
  static void permissionDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Accesso negato",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Devi effettuare l'accesso per utilizzare questa funzione",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ho capito"),
          ),
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, CustomAnimations.rightToLeft(MyPage.login));
              },
              child: const Text(
                "Effettua l'accesso",
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

  /*
  funzione che crea il dialog utilizzato per dare conferma del download degli appunti compleatato con successo
  */
  static void downloadCompleatedDialog(BuildContext context, Topic topic) {
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
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("ok"),
          ),
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextButton(
              onPressed: () {
                LibraryInfo().appuntiScaricati();
                LibraryInfo().addScaricati(topic);
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

  static void searchDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Attenzione",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Devi inserire almeno un campo per effettuare la ricerca",
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