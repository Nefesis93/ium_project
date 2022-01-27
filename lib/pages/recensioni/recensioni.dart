import 'package:flutter/material.dart';
import 'package:ium_project/pages/appunti/appunti_utility.dart';
import 'package:ium_project/utility/custom_dialogs.dart';

class Recensioni extends StatelessWidget {
  const Recensioni({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barra superiore
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Recensioni",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      //lista degli appunti
      body: ListView(
        shrinkWrap: true,
        children: <Widget> [
          //container che contiene le 3 stelline a inizio pagina
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //bottone chiarezza
                TextButton(
                  onLongPress: () {
                    MyDialogs.chiarezzaDialog(context);
                  },
                  onPressed: () {
                    MyDialogs.chiarezzaDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[ 
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Chiarezza",
                      ) 
                    ],
                  )
                ),
                //bottone validità
                TextButton(
                  onLongPress: () {
                    MyDialogs.validitaDialog(context);
                  },
                  onPressed: () {
                    MyDialogs.validitaDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[ 
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "Validitá",
                      ),
                    ],
                  )
                ),
                //bottone completezza
                TextButton(
                  onLongPress: () {
                    MyDialogs.completezzaDialog(context);
                  },
                  onPressed: () {
                    MyDialogs.completezzaDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[ 
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "Completezza",
                      ) 
                    ],
                  )
                )
              ],
            )
          ),
          AppuntiUtility.getRecensioni(context),
          
        ],
      ),
    );
  }
}