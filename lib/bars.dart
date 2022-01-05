import 'package:flutter/material.dart';
import 'package:ium_project/login.dart';
import 'package:ium_project/main.dart';
import 'package:ium_project/login_info.dart';
import 'package:ium_project/notes_loading.dart';

/*
app bar in alto con le funzioni di ricerca e login
*/
class DefaultBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultBar({Key? key}) : super(key: key);
  
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Home"),
      leading: IconButton(
        onPressed: () => 0,
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        )
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            if (UserLogin().isLoggedIn) {
              //l'utente è loggato
                _logoutDialog(context);
            } else {
              //l'utente non è loggato
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          },
          icon: const Icon(
            Icons.account_circle
          )
        )
      ],  
    );
  }
}

/*
funzione che costruisce il dialog che cercano di accedere a funzioni bloccate per gli utenti non loggati
*/
void _loginDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Accesso negato",
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "Devi effettuare l'accesso per utilizzare questa funzione",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Ho capito"),
        ),
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              "Effettua l'accesso",
              style: TextStyle(
                color: Colors.white
              )
            )
          )
        )
      ],
    )
  );
}

/*
funzione che costruisce il dialog che permette all'utente di disconnettersi
*/
void _logoutDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Sei già loggato",
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "Hai già effettuato l'accesso per questa sessione",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            UserLogin().logout();
            Navigator.pop(context);
          },
          child: const Text("Disconnetti"),
        ),
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Ho capito",
              style: TextStyle(
                color: Colors.white
              )
            )
          )
        )
      ],
    )
  );
}

/*
funzione che fa tornare alla home page con un' animazione customizzata 
*/
Route _home() {
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
            height: 40,
            width: 196,
            decoration: const BoxDecoration(color: Colors.blue),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  _home(),
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ) 
          ),
          Container(
            height: 40,
            width: 196,
            decoration: const BoxDecoration(color: Colors.blue),
            child: IconButton(
              onPressed: () {
                if (UserLogin().getLoginInfo())
                {
                  //l'utente è loggato
                } else {
                  //l'utente non è loggato
                  _loginDialog(context);
                } 
              },
              icon: const Icon(
                Icons.menu_book,
                color: Colors.white,
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
    return FloatingActionButton(
      onPressed: () {
        if (UserLogin().getLoginInfo())
        {
          //l'utente è loggato
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotesLoading()),
          );
        } else {
          //l'utente non è loggato
          _loginDialog(context);
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
      ),
    );
  }
}