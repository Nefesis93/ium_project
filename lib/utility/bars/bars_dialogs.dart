import 'package:flutter/material.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/informations/login_info.dart';

/*
classe che conterrà tutti i dialog utilizzati nelle barre dell'applicazione
*/
class BarsDialogs {
  /*
  funzione che costruisce il dialog che permette all'utente di disconnettersi
  */
  static void logoutDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "Sei già loggato",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Hai già effettuato l'accesso per questa sessione",
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    UserLogin().logout();
                    Navigator.pop(context);
                    LibraryInfo().appuntiCaricati();
                  },
                  child: const Text("Disconnetti"),
                ),
                Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Ho capito",
                            style: TextStyle(color: Colors.white))))
              ],
            ));
  }
}
