import 'package:ium_project/enums/topic.dart';

class HomeQuery {
  final List<Topic> _query;

  const HomeQuery._(this._query);

  List getInstance() {
    return _query;
  }

  static const HomeQuery home = HomeQuery._([Topic.lock, Topic.algebra]);
  static const HomeQuery prova = HomeQuery._([Topic.pdsi, Topic.prototyping]);
  //qui va inserita una const con il risultato di ogni tipo di ricerca prevista dall'app
}