import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';

/*
classe che conterrà tutte le funzioni che generano delle animazioni custom
*/
class CustomAnimations {

  /*
  funzione che chiude la schermata aperta e torna alla schermata passata in input con un'animazione customizzata
  */
  static Route flatAnimation(MyPage page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page.getInstance(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0,0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  
  static Route leftToRight(MyPage page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page.getInstance(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1,0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route rightToLeft(MyPage page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page.getInstance(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1,0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route topToBottom(MyPage page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page.getInstance(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0,1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}