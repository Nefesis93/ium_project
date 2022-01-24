import 'package:ium_project/enums/topic.dart';

class TopicInfo {
  static final TopicInfo _topicInfo = TopicInfo._internal();

  Topic _topic = Topic.lock;

  TopicInfo._internal();

  factory TopicInfo() {
    return _topicInfo;
  }

  void setTopic(Topic topic) {
    _topic = topic;
  }

  Topic getTopic() {
    return _topic;
  }
}