import 'package:flutter/material.dart';

class Search {
  static void searchDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        //colonna che conterrà tutti i parametri di ricerca
        actionsAlignment: MainAxisAlignment.end,
        elevation: 0,
        alignment: Alignment.topRight,
        insetPadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        content: SizedBox(
          width: 330,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //riga Titolo`
              _getInputRow(context, "Titolo"),
              _getInputRow(context, "Facoltà"),
              _getInputRow(context, "Corso"),
              _getInputRow(context, "Prof"),
              _getInputRow(context, "Autore"),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
                  border: Border.all(
                    color: Colors.black
                  ),
                ),
                child: TextButton(
                  onPressed: () => 0,
                  child: const Text(
                    'Cerca',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  /*
  funzione che genera la riga con il testo e l'input box
  */
  static Widget _getInputRow(BuildContext context, String text) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
        border: Border.all(
          color: Colors.black
        ),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: 240,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}