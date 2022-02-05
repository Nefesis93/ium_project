import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/appunti/home_lib_utility.dart';
import 'package:ium_project/utility/bars/bars.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/utility/materie/materia.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List<Topic> _foundtopics = LibraryInfo().getState()
      ? LibraryInfo().getCaricati()
      : LibraryInfo().getScaricati();
  final TextEditingController _search = TextEditingController();

  @override
  initState() {
    _foundtopics = LibraryInfo().getState()
        ? LibraryInfo().getCaricati()
        : LibraryInfo().getScaricati();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Topic> results = [];
    if (enteredKeyword.isEmpty) {
      results = LibraryInfo().getState()
          ? LibraryInfo().getCaricati()
          : LibraryInfo().getScaricati();
    } else {
      enteredKeyword = enteredKeyword.toLowerCase();
      for (Topic t in LibraryInfo().getState()
          ? LibraryInfo().getCaricati()
          : LibraryInfo().getScaricati()) {
        Materia materia = TopicToMateria().getMap()[t];
        if (materia.getDepartment().toLowerCase().contains(enteredKeyword) ||
            materia.getPublisher().toLowerCase().contains(enteredKeyword) ||
            materia.getTeacher().toLowerCase().contains(enteredKeyword) ||
            materia.getTitle().toLowerCase().contains(enteredKeyword) ||
            materia.getTopic().toLowerCase().contains(enteredKeyword)) {
          results.add(t);
        }
      }
    }

    setState(() {
      _foundtopics = results;
    });
  }

  Widget _createBody(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: Colors.blue),
                  bottom: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  LibraryInfo().appuntiCaricati();
                  _search.clear();
                  setState(() {
                    _foundtopics = LibraryInfo().getState()
                        ? LibraryInfo().getCaricati()
                        : LibraryInfo().getScaricati();
                  });
                },
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  minimumSize: const Size.fromWidth(double.infinity),
                ),
                child: Text(
                  "Appunti Caricati",
                  style: TextStyle(
                    fontSize: 18,
                    color: LibraryInfo().getState()
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1, color: Colors.blue),
                  bottom: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
              child: TextButton(
                  onPressed: () {
                    LibraryInfo().appuntiScaricati();
                    _search.clear();
                    setState(() {
                      _foundtopics = LibraryInfo().getState()
                          ? LibraryInfo().getCaricati()
                          : LibraryInfo().getScaricati();
                    });
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    minimumSize: const Size.fromWidth(double.infinity),
                  ),
                  child: Text(
                    "Appunti Scaricati",
                    style: TextStyle(
                      fontSize: 18,
                      color: LibraryInfo().getState()
                          ? Colors.blue.withOpacity(0.3)
                          : Colors.blue,
                    ),
                  )),
            ),
          ],
        ),
        _getBody(
          context,
          LibraryInfo().getState(),
        ),
      ],
    );
  }

  Widget _getBody(BuildContext context, bool caricati) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _foundtopics.length + 1,
        itemBuilder: (BuildContext context, int i) {
          if (i == 0) {
            return _getSearchBar(context);
          } else {
            if (caricati) {
              return _getRowCaricati(context, _foundtopics[i - 1]);
            } else {
              return _getRowScaricati(context, _foundtopics[i - 1]);
            }
          }
        },
      ),
    );
  }

  Widget _getRowScaricati(BuildContext context, Topic topic) {
    return Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () => 0,
                              icon: const Icon(Icons.bookmark),
                              iconSize: 30,
                              color: Colors.yellow.shade700,
                            ),
                          ),
                          HomeLibUtility.getTitle(context, topic, false),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: IconButton(
                          onPressed: () {
                            _downloadCompleatedDialog(context);
                          },
                          icon: const Icon(
                            Icons.download_sharp,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ))
                  ])),
        ]);
  }

  Widget _getRowCaricati(BuildContext context, Topic topic) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
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
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        TopicInfo().setTopic(topic);
                        Navigator.push(context,
                            CustomAnimations.rightToLeft(MyPage.recensioni));
                      },
                      child: const Text(
                        "Visualizza Recensioni",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ])),
    ]);
  }

  void _downloadCompleatedDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "Download Completato",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Appunti scaricati con successo",
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok"),
                ),
              ],
            ));
  }

  Widget _getSearchBar(BuildContext context) {
    return Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        child: TextField(
            onChanged: (value) => _runFilter(value),
            controller: _search,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2)),
              counterText: "",
              suffixIcon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              border: OutlineInputBorder(),
              labelText: "Trova tra i tuoi appunti",
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultBar(),
      floatingActionButton: LibraryInfo().getState() ? getFAB(context) : null,
      resizeToAvoidBottomInset: false,
      body: _createBody(context),
    );
  }

  Widget getFAB(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.only(bottom: 10),
        child: FittedBox(
            child: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/add_appunto')
                .then((value) => setState(() {}));
          },
          child: const Icon(
            Icons.add,
            size: 25,
          ),
        )));
  }
}
