import 'package:ium_project/enums/topic.dart';

class HomeQuery {
  final List<Topic> _query;

  const HomeQuery._(this._query);

  List getInstance() {
    return _query;
  }

  static const HomeQuery home = HomeQuery._([Topic.lock, Topic.algebra]);

  /*questo è il risultato della query solo facoltà con l'aggiunta di
  prototyping se l'utente ha caricato l'appunto precedentemente*/
  static const HomeQuery proto = HomeQuery._([
    Topic.algebra,
    Topic.algoritmi,
    Topic.basi,
    Topic.lock,
    Topic.lockduefasi,
    Topic.pdsi,
    Topic.prototyping,
    Topic.tipidilock,
    Topic.turing
  ]);

  //questo è il risultato della query solo facoltà senza prototyping
  static const HomeQuery facolta = HomeQuery._([
    Topic.algebra,
    Topic.algoritmi,
    Topic.basi,
    Topic.lock,
    Topic.lockduefasi,
    Topic.pdsi,
    Topic.tipidilock,
    Topic.turing
  ]);

  /*
  Questo è il risultato delle query:
  1) titolo-facoltà-prof
  2) titolo-prof
  3) titolo-facoltà
  4) titolo
  */
  static const HomeQuery locks =
      HomeQuery._([Topic.lock, Topic.lockduefasi, Topic.tipidilock]);

  //questo è il risultato di tutte le altre query
  static const HomeQuery lock = HomeQuery._([Topic.lock]);
}
