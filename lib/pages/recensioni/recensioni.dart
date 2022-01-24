import 'package:flutter/material.dart';
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
          //prima recensione
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
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
                        Container(
                          height: 35,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: const Text(
                            "Anonimo1",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //stelline e voti
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Gli appunti sono veramente ben fatti. Sono riuscita a passare l’esame solo grazie a questi appunti."
                        "Da sola non riuscivo a capire molti concetti che invece quì ho trovato espressi molto chiaramente."
                        "Consigliatissimi a chiunque!",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    //pollice commento
                    Container(
                      height: 30,
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          //seconda recensione
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //riga che contiene tutta la prima recensione
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
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
                        Container(
                          height: 35,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(0),
                          child: const Text(
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
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Appunti molto chiari, sintetici e abbastanza completi. Purtroppo non sono riuscito "
                        "a prendere un buon voto all’esame perchè gli argomenti trattati rimangono complessi "
                        "nonostante la chiarezza degli appunti. Non so se consigliarli al 100% ma sono sicuramente ben fatti.",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      alignment: Alignment.bottomRight,
                      //pollice commento
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                    ),
                  ]
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}