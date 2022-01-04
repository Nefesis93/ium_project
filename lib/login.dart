import 'package:flutter/material.dart';
import 'package:ium_project/main.dart';
import 'package:ium_project/login_info.dart';

/*
funzione che chiude la schermata di login con un' animazione customizzata 
*/
Route _loggedIn() {
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
schermata di login
*/
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "User Name",
                  hintText: "Enter valid mail"
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter password"
                )
              )
            ),
            TextButton(
              onPressed: () => 0,
              child: const Text(
                "Forgot Password",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  UserLogin().login();
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(
                    _loggedIn(),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}