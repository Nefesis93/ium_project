import 'package:flutter/material.dart';
import 'package:ium_project/main.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/informations/page_track.dart';

/*
classe che conterrà tutte le funzioni che generano delle animazioni custom
*/
class MyAnimations {
  /*
  funzione che chiude la schermata aperta e torna alla home con un'animazione customizzata
  */
  static Route homeAnimation() {
    PageTrack pageTrack = PageTrack();
    if (pageTrack.getLast() != MyPage.home) {
      PageTrack().pushPage(MyPage.home);
    }
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

  /*
  funzione che chiude la schermata aperta e torna alla schermata passata in input con un'animazione customizzata
  */
  static Route flatAnimation(MyPage page) {
    PageTrack pageTrack = PageTrack();
    if (pageTrack.getLast() != page) {
      pageTrack.pushPage(page);
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page.getInstance(),
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