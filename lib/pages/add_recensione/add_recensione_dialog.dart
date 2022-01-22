import 'package:flutter/material.dart';

/*
classe che conterrà tutti i dialog utilizzati sulla pagina add_recensioni
*/
class AddRecensioneDialog {
  /*
  funzione che costruisce il dialog che conferma l'inserimento di una recensione
  */
  static void recensioneInseritaDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Logout",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Sei sicuro di volerti disconnettere dall'account?",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Annulla"),
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


              },
              child: const Text(
                "Esci",
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
}