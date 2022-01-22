/*
file che mantiene traccia dello stato della libreria
*/
class LibraryInfo {
  static final LibraryInfo _library = LibraryInfo._internal();

  //se settato a true significa che sto nel tab appunti caricati
  bool _state = true;

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
}