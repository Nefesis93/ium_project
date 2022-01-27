import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/utility/bars/bars.dart';
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
      appBar: const CloseAppBar(
        title: "Carica Appunti",
      ),
      body: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 400,
              child: Column(
                children: const <Widget>[
                  Padding(
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
                  Padding(
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
                  Padding(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
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
                  PDFButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}  

class PDFButton extends StatefulWidget {
  const PDFButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddAppuntoState();
  }
}

class _AddAppuntoState extends State<StatefulWidget> {
  bool _fileCheck = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: _fileCheck
            ? 150
            : 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextButton(
            onPressed: () { 
              setState(() {
                _fileCheck = !_fileCheck;
              });
            },
            child: _fileCheck
              ? const Text(
                "Inserisci un documento (.pdf)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                )
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "prova.pdf",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.attachment,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
        Opacity(
          opacity: _fileCheck
          ? 0
          : 1,
          child: Padding(
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
                      Navigator.of(context).push(CustomAnimations.flatAnimation(MyPage.home));
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
        ),
      ]
    );
  }
}