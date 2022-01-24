import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';

class NotesPreview extends StatelessWidget {
  const NotesPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Anteprima appunti",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          getList(TopicInfo().getTopic()),
          getButton(),
        ],
      ),
    );
  }

  Widget getButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: TextButton(
          onPressed: () => 0,
          child: const Text(
            "Scarica gli appunti completi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget getList(Topic topic) {
    switch(topic) {
      case Topic.lock: {
        return Column(
          children: <Widget>[
            Image.asset(
              'assets/images/sincronizzazione1.png',
            ),
            Image.asset(
              'assets/images/sincronizzazione2.png',
            ),
          ],
        );
      }
      case Topic.algebra: {
        return Column(
          children: <Widget>[
            Image.asset(
              'assets/images/algebra1.png',
            ),
            Image.asset(
              'assets/images/algebra2.png',
            ),
            Image.asset(
              'assets/images/algebra3.png',
            ),
          ],
        );
      }
    }
  }
}