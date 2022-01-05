import 'package:flutter/material.dart';
import 'package:ium_project/main.dart';

/*
classe che conterrà tutte le funzioni che generano delle animazioni custom
*/
class MyAnimations {
  /*
  funzione che chiude la schermata aperta e torna alla home con un'animazione customizzata
  */
  static Route homeAnimation() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MyApp(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset.zero;
        const end = Offset.zero;

        var tween = Tween(begin: begin, end: end);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}