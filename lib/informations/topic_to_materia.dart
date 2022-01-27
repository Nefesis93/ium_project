import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/utility/materie/algebra.dart';
import 'package:ium_project/utility/materie/lock.dart';
import 'package:ium_project/utility/materie/materia.dart';
import 'package:ium_project/utility/materie/pdsi.dart';

class TopicToMateria {
  static final TopicToMateria _topicToMateria = TopicToMateria._internal();

  Map map = <Topic, Materia>{
    Topic.lock: Lock(),
    Topic.algebra: Algebra(),
    Topic.pdsi: Pdsi(),
  };

  TopicToMateria._internal();

  factory TopicToMateria() {
    return _topicToMateria;
  }

  Map getMap() {
    return map;
  }
}