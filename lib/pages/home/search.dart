import 'package:flutter/material.dart';
import 'package:ium_project/enums/home_query.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/informations/query_state.dart';
import 'package:ium_project/utility/custom_animations.dart';

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
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(30)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextButton(
                        onPressed: () {
                          /*pseudo-codice

                          //queste credo siano variabili da mettere fuori
                          setMaterie = insieme di tutte le materie
                          boolean queryTitolo = false;
                          boolean queryFacolta = false;
                          boolean queryProf = false;
                          
                          /*questa dovrebbe essere una variabile globale che si setta a true
                          quando l'utente carica un appunto (prototyping)*/
                          boolean queryProto = false;

                          //questa variabile serve a capire se l'utente ha inserito un input
                          riscontrabile nel database oppure no
                          queryValide = false;
                          
                          if (titolo.getInput() != null) {
                            for(materia in setMaterie)
                              if titolo.getInput.lowerCase().equals(materia.getTitle())
                                queryTitolo = true;
                                queryValida = true;
                          }

                          if (facolta.getInput() != null) {
                            for(materia in setMaterie)
                              if facolta.getInput.lowerCase().equals(materia.getDepartment())
                                queryFacolta = true;
                                queryValida = true;
                          }

                          if (corso.getInput() != null) {
                            for(materia in setMaterie)
                              if corso.getInput.lowerCase().equals(materia.getTopic())                                
                                queryValida = true;
                          }

                          if (prof.getInput() != null) {
                            for(materia in setMaterie)
                              if prof.getInput.lowerCase().equals(materia.getTeacher())
                                queryProf = true;
                                queryValida = true;
                          }

                          if (autore.getInput() != null) {
                            for(materia in setMaterie)
                              if titolo.getInput.lowerCase().equals(materia.getTitle())
                                queryValida = true;
                          }

                          //caso in cui l'utente cerca le quattro query che danno le tre locks
                          if ((queryTitolo) || 
                              (queryTitolo && queryFacolta) || 
                              (queryTitolo && queryProf) ||
                              (queryTitolo && queryFacolta && queryProf))
                            if (corso.getInput == null && autore.getInput == null)
                              QueryState().setState(HomeQuery.locks);
                            else { QueryState().setState(HomeQuery.lock); }
                          
                          //caso in cui l'utente cerca solo per facoltà prima di aver caricato un appunto
                          elseif(queryFacolta && !queryProto)
                            if(corso.getInput == null && autore.getInput == null
                                    && titolo.getInput == null && prof.getInput == null)
                              QueryState().setState(HomeQuery.facolta);
                            else { QueryState().setState(HomeQuery.lock); }
                          
                          //caso in cui l'utente cerca solo per facoltà successivamente aver caricato un appunto
                          elseif(queryFacolta && queryProto)
                            if(corso.getInput == null && autore.getInput == null
                                    && titolo.getInput == null && prof.getInput == null)
                              QueryState().setState(HomeQuery.proto);
                            else { QueryState().setState(HomeQuery.lock); }

                          //tutti gli altri casi
                          else {
                            if(queryValida)
                              QueryState().setState(HomeQuery.lock);
                            else {
                              pagina con scritto "Nessun risultato ottenuto"                            
                            }
                          }
                          */

                          /*quì prima c'era .prova e funzionava (2 elementi), se
                          metti .lock che ha un solo elemento da index error*/
                          QueryState().setState(HomeQuery.home);
                          //Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              CustomAnimations.flatAnimation(MyPage.home));
                        },
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
            ));
  }

  /*
  funzione che genera la riga con il testo e l'input box
  */
  static Widget _getInputRow(BuildContext context, String text) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
        border: Border.all(color: Colors.black),
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
                  )),
            ),
          )
        ],
      ),
    );
  }
}
