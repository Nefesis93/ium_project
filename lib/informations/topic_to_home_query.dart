import 'package:ium_project/enums/home_query.dart';
import 'package:ium_project/enums/topic.dart';

class TopicToHomeQuery {
  static final TopicToHomeQuery _topicToHomeQuery = TopicToHomeQuery._internal();

  Map map = <Topic, HomeQuery> {
    Topic.lock: HomeQuery.sistemiOperativi,
    Topic.algebra: HomeQuery.algebra,
    Topic.pdsi: HomeQuery.swEng,
    Topic.basi: HomeQuery.basi,
    Topic.tipidilock: HomeQuery.basi,
    Topic.lockduefasi: HomeQuery.basi,
    Topic.prototyping: HomeQuery.proto,
    Topic.turing: HomeQuery.automi,
    Topic.algoritmi: HomeQuery.algoritmi,
  };

  TopicToHomeQuery._internal();

  factory TopicToHomeQuery() {
    return _topicToHomeQuery;
  }

  Map getMap() {
    return map;
  }
}