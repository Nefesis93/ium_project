import 'package:flutter/material.dart';
import 'package:ium_project/enums/my_page.dart';

class Animations {
  static Route flatAnimation(MyPage page) {
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