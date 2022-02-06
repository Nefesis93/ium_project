import 'package:flutter/material.dart';
import 'package:ium_project/enums/filters.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/search_info.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/appunti/home_lib_utility.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/utility/materie/materia.dart';
import 'package:ium_project/pages/home/search.dart';

class Risultati extends StatelessWidget {
  const Risultati({Key? key}) : super(key: key);

  Widget _createBody(BuildContext context, Filters filter) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: SearchInfo().getRisultati().length + 1,
      itemBuilder: (BuildContext context, int i) {
        if (i == 0) {
          return Container(
              height: 70,
              color: Colors.blue,
              child: Search.getSearchBar(context, filter));
        } else {
          return _getRow(context, SearchInfo().getRisultati()[i - 1]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(context, SearchInfo().getFilter()),
    );
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
