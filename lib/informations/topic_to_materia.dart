import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/utility/materie/algebra.dart';
import 'package:ium_project/utility/materie/algoritmi.dart';
import 'package:ium_project/utility/materie/basi.dart';
import 'package:ium_project/utility/materie/lock.dart';
import 'package:ium_project/utility/materie/lockduefasi.dart';
import 'package:ium_project/utility/materie/materia.dart';
import 'package:ium_project/utility/materie/pdsi.dart';
import 'package:ium_project/utility/materie/prototyping.dart';
import 'package:ium_project/utility/materie/tipidilock.dart';
import 'package:ium_project/utility/materie/turing.dart';

class TopicToMateria {
  static final TopicToMateria _topicToMateria = TopicToMateria._internal();

  Map map = <Topic, Materia> {
    Topic.lock: Lock(),
    Topic.algebra: Algebra(),
    Topic.pdsi: Pdsi(),
    Topic.basi: Basi(),
    Topic.tipidilock: TipiDiLock(),
    Topic.lockduefasi: LockDueFasi(),
    Topic.prototyping: Prototyping(),
    Topic.turing: Turing(),
    Topic.algoritmi: Algoritmi(),
  };

  TopicToMateria._internal();

  factory TopicToMateria() {
    return _topicToMateria;
  }

  Map getMap() {
    return map;
  }
}