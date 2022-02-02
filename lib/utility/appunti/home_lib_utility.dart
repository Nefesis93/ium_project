import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/informations/topic_to_materia.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/utility/materie/materia.dart';

class HomeLibUtility {
  static Widget getTitle(BuildContext context, Topic topic, bool caricati) {
    return TextButton(
        onPressed: () {
          TopicInfo().setTopic(topic);
          Navigator.push(context, CustomAnimations.rightToLeft(MyPage.appunti));
        },
        style: TextButton.styleFrom(
          padding: caricati
              ? const EdgeInsets.fromLTRB(10, 10, 10, 10)
              : const EdgeInsets.fromLTRB(0, 10, 10, 10),
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
              (TopicToMateria().getMap()[topic] as Materia).getTopic() +
                  " • " +
                  (TopicToMateria().getMap()[topic] as Materia).getDate(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ));
  }
}
