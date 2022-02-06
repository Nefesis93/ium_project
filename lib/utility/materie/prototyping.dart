import 'materia.dart';

class Prototyping extends Materia {
  Prototyping()
      : super(
          "Prototyping",
          "Edward Elric",
          "Interazione Uomo Macchina",
          "Prof. Panizzi",
          "Facoltà di Informatica",
          ['assets/images/prototyping1.png', 'assets/images/prototyping2.png'],
          0,
          0,
          DateTime.now().day.toString() +
              "/" +
              DateTime.now().month.toString() +
              "/" +
              DateTime.now().year.toString().substring(2),
        );
}
