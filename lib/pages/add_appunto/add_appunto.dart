import 'package:flutter/material.dart';
import 'package:ium_project/utility/custom_animations.dart';

import 'add_appunto_dialog.dart';

/*
schermata di caricamento appunti
*/
class AddAppunto extends StatelessWidget {
  const AddAppunto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carica Appunti"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: TextField(
                maxLength: 25,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(),
                  labelText: "Titolo",
                  hintText: "Inserisci il titolo dei tuoi appunti"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLength: 25,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(),
                  labelText: "Facoltà",
                  hintText: "Inserisci la facoltà"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLength: 25,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(),
                  labelText: "Corso",
                  hintText: "Inserisci il corso"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: TextField(
                maxLength: 25,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(),
                  labelText: "Prof.",
                  hintText: "Inserisci il cognome del Prof."
                )
              )
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  //inserire qui la funzione 
                },
                child: const Text(
                  "Inserisci un documento (.pdf)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  )
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
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
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(
                          MyAnimations.homeAnimation()
                        );
                      },
                      child: const Text(
                        "Annulla",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                        )
                      )
                    )
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                      onPressed: () {
                        AddAppuntoDialogs.uploadDialog(context);
                      },
                      child: const Text(
                        "Carica",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        )
                      )
                    )
                  ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}