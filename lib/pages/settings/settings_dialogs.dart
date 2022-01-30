import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/informations/login_info.dart';

/*
classe che conterrà tutti i dialog utilizzati sulla pagina settings
*/
class SettingsDialogs {
  /*
  funzione che costruisce il dialog chiede conferma all'utente prima di fare il logout
  */
  static void confirmLogoutDialog(BuildContext context) {
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
                UserLogin().logout();
                Navigator.pop(context);
                Navigator.of(context).push(CustomAnimations.flatAnimation(MyPage.home));
              },
              child: const Text(
                "Disconnetti",
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
  funzione che costruisce il dialog chiede conferma all'utente prima di fare il logout
  */
  static void changePasswordDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Cambio password",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Abbiamo inviato una email al tuo indirizzo di posta elettronica per cambiare la password",
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
  funzione che costruisce il dialog ricorda all'utente di non essere loggato
  */
  static void alreadyLogoutDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Attenzione",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Al momento non sei loggato nell'applicazione",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          ),
        ],
      )
    );
  }
}