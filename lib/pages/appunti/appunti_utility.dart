import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/materie/materia.dart';

class AppuntiUtility {

  static Widget getButtonScarica(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextButton(
        onPressed: () {
          if (UserLogin().getLoginInfo()) {
            //l'utente è loggato
            MyDialogs.downloadCompleatedDialog(context);
          } else {
            //l'utente non è loggato
            MyDialogs.permissionDialog(context);
          }
        },
        child: const Text(
          "Scarica",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25
          )
        ),
      )
    );
  }

  static Widget getBody(BuildContext context, Topic topic) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          //titolo
          child: Column(
            children: <Widget>[
              Text(
                (TopicToMateria().getMap()[topic] as Materia).getTitle(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                //riga contenente due colonne
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (TopicToMateria().getMap()[topic] as Materia).getPublisher(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            "Prof. Tolomei",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            (TopicToMateria().getMap()[topic] as Materia).getTopic(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            (TopicToMateria().getMap()[topic] as Materia).getDepartment(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
              //bottone scarica
              AppuntiUtility.getButtonScarica(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 330,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset(
                            (TopicToMateria().getMap()[topic] as Materia).getList()[0],
                            height: 300,
                          ),
                          iconSize: 320,
                          onPressed: () {
                            Navigator.pushNamed(
                                  context, '/notes_preview');
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            (TopicToMateria().getMap()[topic] as Materia).getList()[1],
                            height: 300,
                          ),
                          iconSize: 320,
                          onPressed: () {
                            Navigator.pushNamed( context, '/notes_preview');
                          },
                        ),
                      ],
                    ) 
                  )
                ),
              ),
            ],
          )
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: const Text(
            "Valutazioni e Recensioni",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Container(
            height: 50,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: TextButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/add_recensione')
              },
              child: const Text(
                "Scrivi una recensione",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )   
              ),
            ),
          ),
        ),
        AppuntiUtility.getRecensioni(context),
      ]
    );
  }

  static Widget getRecensioni(BuildContext context) {
    double myOpacity = 0.3;
    return Column(
      children: <Widget> [
        //container che contiene le 3 stelline a inizio pagina
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: Colors.blue),
              top: BorderSide(width: 2, color: Colors.blue),
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
                            child: IconButton(
                              onPressed: () {
                               myOpacity = 1;
                               //non funziona
                              },
                              icon: const Icon(
                                Icons.thumb_up_alt,
                                color: Colors.blue,
                              ),
                            ),
                            opacity: myOpacity,
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
    );
  }
}