import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/informations/recensione.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/pages/appunti/appunti_utility.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/materie/materia.dart';

class RecensioneInserita extends StatelessWidget {
  const RecensioneInserita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const DefaultBottomBar(),
      floatingActionButton: const FloatingPlusButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          //titolo
          child: Column(
            children: <Widget>[
              Text(
                (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getTitle(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
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
                            (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getPublisher(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getTeacher(),
                            style: const TextStyle(
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
                            (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getTopic(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getDepartment(),
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
              AppuntiUtility.getButtonScarica(context, TopicInfo().getTopic()),
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
                            (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getList()[0],
                            height: 300,
                          ),
                          iconSize: 320,
                          onPressed: () {
                            Navigator.push(context, CustomAnimations.rightToLeft(MyPage.notesPreview));
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            (TopicToMateria().getMap()[TopicInfo().getTopic()] as Materia).getList()[1],
                            height: 300,
                          ),
                          iconSize: 320,
                          onPressed: () {
                            Navigator.push(context, CustomAnimations.rightToLeft(MyPage.notesPreview));
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
        _getButtonRecensione(context, TopicInfo().getTopic()),
        //AppuntiUtility.getRecensioni(context, TopicInfo().getTopic()),
        Column(
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
                  CustomDialogs.chiarezzaDialog(context);
                },
                onPressed: () {
                  CustomDialogs.chiarezzaDialog(context);
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
                  CustomDialogs.validitaDialog(context);
                },
                onPressed: () {
                  CustomDialogs.validitaDialog(context);
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
                  CustomDialogs.completezzaDialog(context);
                },
                onPressed: () {
                  CustomDialogs.completezzaDialog(context);
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
        _getBoxRecensione(
          context,
          "Edward Elric",
          Recensione().getVotoChiarezza(),
          Recensione().getVotoValidita(),
          Recensione().getVotoCompletezza(),
          Recensione().getRecensione(),
          true
        ),


        _getBoxRecensione(
              context, 
              "Roy Mustang", 
              4, 
              3, 
              5, 
              "Gli appunti sono veramente ben fatti. Sono riuscita a passare l’esame solo grazie a questi appunti."
              "Da sola non riuscivo a capire molti concetti che invece quì ho trovato espressi molto chiaramente."
              "Consigliatissimi a chiunque!",
              false
            ),
            //seconda recensione
            _getBoxRecensione(
              context, 
              "Louis Armstrong", 
              1, 
              2, 
              4, 
              "Appunti molto chiari, sintetici e abbastanza completi. Purtroppo non sono riuscito "
              "a prendere un buon voto all’esame perchè gli argomenti trattati rimangono complessi "
              "nonostante la chiarezza degli appunti. Non so se consigliarli al 100% ma sono sicuramente ben fatti.",
              false,
            ),
      ],
    )
      ]
    ),
    );
  }

    static Widget _getButtonRecensione(BuildContext context, Topic topic) {
    if (!LibraryInfo().getCaricati().contains(topic)) {
      return Padding(
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
              "Modifica la tua Recensione",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )   
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  static Widget _getBoxRecensione(BuildContext context, String nome, int chiarezza, int validita, int completezza, String testoRecensione, bool personale) {
    Map<int, Color> coloreVoto = {
      1 : Colors.red.shade600,
      2 : Colors.red.shade400,
      3 : Colors.orange,
      4 : Colors.lightGreen.shade300,
      5 : Colors.green.shade500
    };

    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: personale ? Colors.blue[50] : Colors.white,
            border: const Border(
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
                    child: Text(
                      nome,
                      style: const TextStyle(
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
                          children: <Widget>[
                            //voto stellina blu
                            Text(
                              chiarezza.toString(),
                              style: TextStyle(
                                color: coloreVoto[chiarezza],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //voto stellina verde
                            Text(
                              validita.toString(),
                              style: TextStyle(
                                color:coloreVoto[validita],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //voto stellina rossa
                            Text(
                              completezza.toString(),
                              style: TextStyle(
                                color: coloreVoto[completezza],
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
                child: Text(
                  testoRecensione,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              //pollice commento
              _getPollice(personale)
            ],
          ),
        ),
      ],
    );
  }


  static Widget _getPollice(bool personale) {
    if (personale) {
      return Container(
        padding: const EdgeInsets.only(bottom: 20),
      );
    } else {
      return Container(
                  height: 30,
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      //commento utile?
                      Padding(
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
                      LikeButton(),
                    ],
                  ),
                );
    } 
  }
}