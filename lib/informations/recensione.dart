class Recensione {
  static final Recensione _recensione = Recensione._internal();

  String _testoRecensione = '';
  int _votoChiarezza = 0;
  int _votoValidita = 0;
  int _votoCompletezza = 0;

  Recensione._internal();

  factory Recensione() {
    return _recensione;
  }

  void setRecensione(String recensione) {
    _testoRecensione = recensione;
  }

  void setChiarezza(int votoChiarezza) {
    _votoChiarezza = votoChiarezza;
  }

  void setValidita(int votoValidita) {
    _votoValidita = votoValidita;
  }

  void setCompletezza(int votoCompletezza) {
    _votoCompletezza = votoCompletezza;
  }

  String getRecensione() {
    return _testoRecensione;
  }

  int getVotoChiarezza() {
    return _votoChiarezza;
  }

  int getVotoValidita() {
    return _votoValidita;
  }

  int getVotoCompletezza() {
    return _votoCompletezza;
  }
}