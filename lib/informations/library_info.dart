import 'package:ium_project/enums/topic.dart';

/*
file che mantiene traccia dello stato della libreria
*/
class LibraryInfo {
  static final LibraryInfo _library = LibraryInfo._internal();

  //se settato a true significa che sto nel tab appunti caricati
  bool _state = true;
  List<Topic> _caricati = [Topic.lock, Topic.basi];
  List<Topic> _scaricati = [Topic.pdsi, Topic.algoritmi, Topic.turing];
  
  LibraryInfo._internal();

  factory LibraryInfo() {
    return _library;
  }

  void appuntiCaricati() {
    if (!_state) {
      _state = !_state;
    }
  }

  void appuntiScaricati() {
    if (_state) {
      _state = !_state;
    }
  }

  bool getState() {
    return _state;
  }

  void addCaricati(Topic topic) {
    if (!_caricati.contains(topic)) {
      _caricati.add(topic);
    }
  }

  void addScaricati(Topic topic) {
    if (!_scaricati.contains(topic)) {
      _scaricati.add(topic);
    }
  }

  List<Topic> getCaricati() {
    return _caricati;
  }

  List<Topic> getScaricati() {
    return _scaricati;
  }
}