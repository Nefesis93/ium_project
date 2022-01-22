import 'package:flutter/material.dart';
import 'package:ium_project/pages/recensioni/recensioni_dialogs.dart';

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
            width: 392,
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
                    RecensioniDialogs.chiarezzaDialog(context);
                  },
                  onPressed: () {
                    RecensioniDialogs.chiarezzaDialog(context);
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
                    RecensioniDialogs.validitaDialog(context);
                  },
                  onPressed: () {
                    RecensioniDialogs.validitaDialog(context);
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
                    RecensioniDialogs.completezzaDialog(context);
                  },
                  onPressed: () {
                    RecensioniDialogs.completezzaDialog(context);
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
          //prima recensione
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //riga che contiene tutta la prima recensione
              Container(
                height: 185,
                width: 392,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    //nome, stelline e voti
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //nome
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Anonimo1",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //stelline e voti
                        SizedBox(
                          //padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                          height: 45,
                          width: 150,
                          child: Column(
                            children: <Widget>[
                              //riga stelline
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              //riga voti
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const <Widget>[
                                  //voto stellina blu
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //voto stellina verde
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //voto stellina rossa
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //recensione
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 40, 0),
                      child: Text(
                        "Gli appunti sono veramente ben fatti. Sono riuscita a passare l’esame solo grazie a questi appunti."
                        "Da sola non riuscivo a capire molti concetti che invece quì ho trovato espressi molto chiaramente."
                        "Consigliatissimi a chiunque!",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    //pollice commento
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  <Widget>[
                        //commento utile?
                        const Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "Ti è stata utile questa recensione?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        //pollice
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Opacity(
                            opacity: 0.3,
                            child: IconButton(
                              onPressed: () => 0,
                              icon: const Icon(
                                Icons.thumb_up_alt,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ]
                ),
              ),
            ]
          ),
          //seconda recensione
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //riga che contiene tutta la prima recensione
              Container(
                height: 205,
                width: 392,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //nome, stelline e voti
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //nome
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Anonimo2",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //stelline e voti
                        SizedBox(
                          //padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                          height: 45,
                          width: 150,
                          child: Column(
                            children: <Widget>[
                              //riga stelline
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              //riga voti
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const <Widget>[
                                  //voto stellina blu
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //voto stellina verde
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //voto stellina rossa
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //recensione
                    const Padding(
                      padding:EdgeInsets.fromLTRB(10, 10, 40, 0),
                      child: Text(
                        "Appunti molto chiari, sintetici e abbastanza completi. Purtroppo non sono riuscito "
                        "a prendere un buon voto all’esame perchè gli argomenti trattati rimangono complessi "
                        "nonostante la chiarezza degli appunti. Non so se consigliarli al 100% ma sono sicuramente ben fatti.",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    //pollice commento
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  <Widget>[
                        //commento utile?
                        const Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "Ti è stata utile questa recensione?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        //pollice
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Opacity(
                            opacity: 0.3,
                            child: IconButton(
                              onPressed: () => 0,
                              icon: const Icon(
                                Icons.thumb_up_alt,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ]
                ),
              ),
            ]
          ),
          //ultimo elemento della lsita, serve per far sembrare la lista grande come tutta la pagina, va ridimensionato in base al numero di elementi
          Expanded(
            child: Container(
              height: 225,
            ),
          ),
        ],
      ),
    );
  }
}