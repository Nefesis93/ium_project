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
    Topic.lock,
    Topic.pdsi,
    Topic.basi,
    Topic.tipidilock,
    Topic.turing,
    Topic.lockduefasi,
    Topic.prototyping,
  ]);

  //questo è il risultato della query solo facoltà senza prototyping
  static const HomeQuery facolta = HomeQuery._([
    Topic.algebra,
    Topic.lock,
    Topic.pdsi,
    Topic.algoritmi,
    Topic.basi,
    Topic.tipidilock,
    Topic.lockduefasi,
    Topic.turing
  ]);

  //query per sistemi operativi
  static const HomeQuery sistemiOperativi = HomeQuery._([Topic.lock]);

  //query per algebra
  static const HomeQuery algebra = HomeQuery._([Topic.algebra]);

  //query per algoritmi
  static const HomeQuery algoritmi = HomeQuery._([Topic.algoritmi]);

  //query per basi
  static const HomeQuery basi = HomeQuery._([Topic.basi, Topic.tipidilock, Topic.lockduefasi]);

  //query per ingegneria del softwere
  static const HomeQuery swEng = HomeQuery._([Topic.pdsi]);

  //query per automi
  static const HomeQuery automi = HomeQuery._([Topic.turing]);
  
  //query per lock nel titolo
  static const HomeQuery locks = HomeQuery._([Topic.lock, Topic.lockduefasi, Topic.tipidilock]);

  static const HomeQuery basiProf = HomeQuery._([Topic.basi]);
}