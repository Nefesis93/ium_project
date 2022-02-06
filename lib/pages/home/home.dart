import 'package:flutter/material.dart';
import 'package:ium_project/enums/home_query.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/query_state.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/appunti/home_lib_utility.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/utility/materie/materia.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //barra superiore
        appBar: const DefaultBar(),
        //più della barra inferiore
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        resizeToAvoidBottomInset: false,
        //lista degli appunti
        body: _getBody(context, QueryState().getState()));
  }

  Widget _getBody(BuildContext context, HomeQuery query) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: query.getInstance().length + 1,
      itemBuilder: (BuildContext context, int i) {
        if (i == 0) {
          if (QueryState().getState() == HomeQuery.home) {
            return _getSubTitle(context, "Appunti piú Scaricati");
          } else {
            return _getSubTitle(context, "Risultati ricerca");
          }
        } else {
          return _getRow(context, query.getInstance()[i - 1]);
        }
      },
    );
  }

  Widget _getSubTitle(BuildContext context, String subTitle) {
    return Container(
        height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2, color: Colors.blue),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            subTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ));
  }

  Widget _getRow(BuildContext context, Topic topic) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
            HomeLibUtility.getTitle(context, topic, true),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Opacity(
                          opacity: (TopicToMateria().getMap()[topic] as Materia)
                                      .getVoto() >
                                  0
                              ? 1
                              : 0.3,
                          child: const Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Opacity(
                          opacity: (TopicToMateria().getMap()[topic] as Materia)
                                      .getVoto() >
                                  1
                              ? 1
                              : 0.3,
                          child: const Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Opacity(
                          opacity: (TopicToMateria().getMap()[topic] as Materia)
                                      .getVoto() >
                                  2
                              ? 1
                              : 0.3,
                          child: const Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Opacity(
                          opacity: (TopicToMateria().getMap()[topic] as Materia)
                                      .getVoto() >
                                  3
                              ? 1
                              : 0.3,
                          child: const Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Opacity(
                          opacity: (TopicToMateria().getMap()[topic] as Materia)
                                      .getVoto() >
                                  4
                              ? 1
                              : 0.3,
                          child: const Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
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
                          TopicInfo().setTopic(topic);
                          Navigator.push(context,
                              CustomAnimations.rightToLeft(MyPage.recensioni));
                        },
                        child: Text(
                          "Recensioni: " +
                              (TopicToMateria().getMap()[topic] as Materia)
                                  .getNumeroRecensioni()
                                  .toString(),
                          style: const TextStyle(
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
                    Navigator.push(context,
                        CustomAnimations.rightToLeft(MyPage.notesPreview));
                  },
                  icon: const Icon(
                    Icons.find_in_page_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
            ]),
          ])),
    ]);
  }
}
