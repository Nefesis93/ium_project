import 'package:flutter/material.dart';
import 'package:ium_project/utility/bars/bars.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barra superiore
      appBar: const DefaultBar(
        title: "Home",
      ),
      //barra inferiore
      bottomNavigationBar: const DefaultBottomBar(),
      //più della barra inferiore
      floatingActionButton: const FloatingPlusButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //lista degli appunti
      body: ListView(
            shrinkWrap: true,
            children: <Widget> [
              Container(
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.blue),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Appunti piú Scaricati",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                )
              ),
              //prima riga della lista di appunti
              Row(  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //bottone degli appunti
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () => 0,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(20, 15, 105, 10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Lock",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Sistemi Operativi",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: const <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/recensioni');
                                      },
                                      child: const Text(
                                        "Recensioni: 185",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                onPressed: () => 0,
                                icon: const Icon(
                                  Icons.find_in_page_outlined,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ),
                            ),
                          ]
                        ),
                      ]
                    )
                  ),
                ]
              ),
              //seconda riga della lista 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //bottoni con le scritte
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(20, 15, 130, 10),
                            //alignment: Alignment.centerLeft,
                            //minimumSize: const Size.fromWidth(double.infinity),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Algebra",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Algebra",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: const <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/recensioni');
                                      },
                                      child: const Text(
                                        "Recensioni: 150",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                onPressed: () => 0,
                                icon: const Icon(
                                  Icons.find_in_page_outlined,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ),
                            ),
                          ]
                        ),
                      ]
                    )
                  ),
                ]
              ),
              //ultimo elemento della lista, serve per far sembrare la lista grande come tutta la pagina, va ridimensionato in base al numero di elementi
              Container(
                height: 422,
              ),
            ]
          ),
    );
  }
}