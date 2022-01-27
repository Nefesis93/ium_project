import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/materie/materia.dart';

class HomeLibUtility {
  static Widget getTitle(BuildContext context, Topic topic) {
    return TextButton(
      onPressed: () {
        TopicInfo().setTopic(topic);
        Navigator.pushNamed(context, '/appunti');
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        alignment: Alignment.centerLeft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            (TopicToMateria().getMap()[topic] as Materia).getTitle(),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            (TopicToMateria().getMap()[topic] as Materia).getTopic(),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      )
    );
  }
}