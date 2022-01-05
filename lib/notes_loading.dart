import 'package:flutter/material.dart';
import 'package:ium_project/custom_animations.dart';

/*
funzione che costruisce il dialog che conferma l'inserimento di un appunto
*/
void _uploadDialog(BuildContext context) {
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

/*
schermata di caricamento appunti
*/
class NotesLoading extends StatelessWidget {
  const NotesLoading({Key? key}) : super(key: key);

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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Titolo",
                  hintText: "Inserisci il titolo dei tuoi appunti"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Facoltà",
                  hintText: "Inserisci la facoltà"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Corso",
                  hintText: "Inserisci il corso"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: TextField(
                decoration: InputDecoration(
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
                        _uploadDialog(context);
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