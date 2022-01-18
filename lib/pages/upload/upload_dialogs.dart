import 'package:flutter/material.dart';
import 'package:ium_project/utility/custom_animations.dart';

/*
classe che conterrà tutti i dialog utilizzati nella pagina di upload degli appunti
*/
class UploadDialogs {
  /*
  funzione che costruisce il dialog che conferma l'inserimento di un appunto
  */
  static void uploadDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          "Appunti caricati con successo",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(
                MyAnimations.homeAnimation()
              );
            },
            child: const Text("ok"),
          ),
        ],
      )
    );
  }
}