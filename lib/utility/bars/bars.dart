import 'package:flutter/material.dart';
import 'package:ium_project/informations/library_info.dart';
import 'package:ium_project/pages/login/login.dart';
import 'package:ium_project/pages/library/library.dart';
import 'package:ium_project/pages/settings/settings.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/utility/bars/bars_dialogs.dart';

/*
app bar in alto con le funzioni di ricerca e login
*/
class DefaultBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultBar({Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          //codice
        },
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        )
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            if (UserLogin().getLoginInfo()) {
              //l'utente è loggato
              BarsDialogs.logoutDialog(context);
            } else {
              //l'utente non è loggato
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          },
          icon: const Icon(
            Icons.account_circle,
            size: 30,
          )
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Settings()),
            );
          },
          icon: const Icon(
            Icons.settings,
            size: 30,
          )
        ),
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
            width: MediaQuery.of(context).size.width/2 -1,
            decoration: const BoxDecoration(color: Colors.blue),
            child: IconButton(
              onPressed: () {
                //resetto lo stato della libreria
                LibraryInfo().appuntiCaricati();
                Navigator.of(context).pushReplacement(
                  BarsDialogs.home(),
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
            ) 
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width/2 -1,
            decoration: const BoxDecoration(color: Colors.blue),
            child: IconButton(
              onPressed: () {
                //resetto lo stato della libreria
                LibraryInfo().appuntiCaricati();
                if (UserLogin().getLoginInfo())
                {
                  //l'utente è loggato
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Library()),
                  );
                } else {
                  //l'utente non è loggato
                  MyDialogs.permissionDialog(context);
                } 
              },
              icon: const Icon(
                Icons.menu_book,
                color: Colors.white,
                size: 30,
              )
            )
          ),
        ]
      )
    );
  }
}

/*
pulsante + che andrà inserito nel mezzo della bottom bar
*/
class FloatingPlusButton extends StatelessWidget {
  const FloatingPlusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        onPressed: () {
          if (UserLogin().getLoginInfo())
          {
            //l'utente è loggato
            Navigator.pushNamed(context, '/add_appunto');
          } else {
            //l'utente non è loggato
            MyDialogs.permissionDialog(context);
          } 
        },
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.blue,
            width: 2,
          )
        ),
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      )
    );
  }
}