/*
file che mantiene traccia dello stato della libreria
*/
class MyLybrary {
  static final MyLybrary _library = MyLybrary._internal();

  //se settato a true significa che sto nel tab appunti caricati
  bool _state = true;

  MyLybrary._internal();

  factory MyLybrary() {
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