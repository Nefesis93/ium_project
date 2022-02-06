import 'package:flutter/material.dart';
import 'package:ium_project/enums/filters.dart';
import 'package:ium_project/enums/home_query.dart';
import 'package:ium_project/enums/my_page.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/informations/query_state.dart';
import 'package:ium_project/pages/home/search.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/utility/custom_dialogs.dart';

import '../custom_animations.dart';

/*
app bar in alto con le funzioni di ricerca e login
*/
class DefaultBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'APPunti',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Search.searchDialog(context, Filters.none);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, CustomAnimations.rightToLeft(MyPage.settings));
            },
            icon: const Icon(
              Icons.settings,
              size: 30,
            )),
      ],
    );
  }
}

/*
bottom app bar con le funzioni di tornare alla home e vedere gli appunti del proprio account
*/
class DefaultBottomBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultBottomBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 2 - 1,
              decoration: const BoxDecoration(color: Colors.blue),
              child: IconButton(
                onPressed: () {
                  //resetto lo stato della libreria
                  LibraryInfo().appuntiCaricati();
                  QueryState().setState(HomeQuery.home);
                  Navigator.of(context).pushReplacement(
                      CustomAnimations.flatAnimation(MyPage.home));
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              )),
          Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 2 - 1,
              decoration: const BoxDecoration(color: Colors.blue),
              child: IconButton(
                  onPressed: () {
                    //resetto lo stato della libreria
                    LibraryInfo().appuntiCaricati();
                    if (UserLogin().getLoginInfo()) {
                      //l'utente è loggato
                      Navigator.of(context).pushReplacement(
                          CustomAnimations.flatAnimation(MyPage.library));
                    } else {
                      //l'utente non è loggato
                      CustomDialogs.permissionDialog(context);
                    }
                  },
                  icon: const Icon(
                    Icons.menu_book,
                    color: Colors.white,
                    size: 30,
                  ))),
        ]));
  }
}

class CloseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CloseAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 30,
            ))
      ],
    );
  }
}
