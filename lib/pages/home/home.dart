import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/utility/appunti/home_lib_utility.dart';
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
      body: ListView(shrinkWrap: true, children: <Widget>[
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
        _getRow(context, Topic.lock),
        _getRow(context, Topic.algebra),
        ]
      ),
    );
  }

  Widget _getRow(BuildContext context, Topic topic) {
    return Row(
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
                HomeLibUtility.getTitle(context, topic),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
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
                              Navigator.pushNamed(
                                  context, '/recensioni');
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
                      onPressed: () {
                        TopicInfo().setTopic(topic);
                        Navigator.pushNamed(context, '/notes_preview');
                      },
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
    );
  }

}
