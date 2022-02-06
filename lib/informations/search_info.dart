import 'package:ium_project/enums/filters.dart';
import 'package:ium_project/enums/topic.dart';

/*
file che mantiene traccia dello stato della libreria
*/
class SearchInfo {
  static final SearchInfo _search = SearchInfo._internal();

  //filtro
  Filters _filter = Filters.none;
  List<Topic> _risultati = [];

  SearchInfo._internal();

  factory SearchInfo() {
    return _search;
  }

  Filters getFilter() {
    return _filter;
  }

  void setFilter(Filters filter) {
    _filter = filter;
  }

  void addRisultato(Topic t) {
    _risultati.add(t);
  }

  void clearRisultato() {
    _risultati = [];
  }

  List<Topic> getRisultati() {
    return _risultati;
  }
}
