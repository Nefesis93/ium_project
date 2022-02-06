import 'package:flutter/material.dart';

/*
classe che conterrà tutti i dialog utilizzati sulla pagina di login
*/
class LoginDialogs {
  /*
  funzione che costruisce il dialog che permette di inserire la mail nel caso di password dimenticata
  */
  static void forgotPasswordDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "Recupero password",
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text(
                    "Inserire la tua email per il recupero della password",
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: TextField(
                          maxLength: 25,
                          decoration: InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              hintText: "Inserisci la tua email")))
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          emailDialog(context);
                        },
                        child: const Text("Invia",
                            style: TextStyle(color: Colors.white)))),
              ],
            ));
  }

  /*
  funzione che costruisce il dialog che conferma l'inserimento dell'indirizzo email
  */
  static void emailDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "Email inviata",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Abbiamo inviato una email al tuo indirizzo di posta elettronica per recuperare la password",
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
            ));
  }

  static void fieldsDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "Attenzione",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Inserisci una email e una password per poter effettuare il login",
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
            ));
  }

  /*
  funzione che costruisce il dialog che conferma l'inserimento dell'indirizzo email
  */
  void missingEmailDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "Inserire email",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Devi prima inserire l'email per recuperare la password",
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
            ));
  }
}
