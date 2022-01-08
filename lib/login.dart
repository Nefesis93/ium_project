import 'package:flutter/material.dart';
import 'package:ium_project/login_info.dart';
import 'package:ium_project/custom_animations.dart';

/*
funzione che costruisce il dialog che permette di inserire la mail nel caso di password dimenticata
*/
void _forgotPasswordDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Recupero password",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const  <Widget>[
          Text(
            "Inserire la tua email per il recupero della password",
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child:TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Inserisci la tua email"
              )
            )
          )
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              //da inserire condizione se testo è vuoto oppure no if
              Navigator.pop(context);
              _emailDialog(context);
              //else
              //_missingEmailDialog(context);
            },
            child: const Text(
              "Invia",
              style: TextStyle(
                color: Colors.white
              )
            )
          )
        ),
      ],
    )
  );
}

/*
funzione che costruisce il dialog che conferma l'inserimento dell'indirizzo email
*/
void _emailDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Email inviata",
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "Abbiamo inviato una email al tuo indirizzo di posta elettronica per recuperare la password",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("ok"),
        ),
      ],
    )
  );
}

/*
funzione che costruisce il dialog che conferma l'inserimento dell'indirizzo email
*/
void _missingEmailDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Inserire email",
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "Devi prima inserire l'email per recuperare la password",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("ok"),
        ),
      ],
    )
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
              onPressed: () {
                _forgotPasswordDialog(context);
              },
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
                    MyAnimations.homeAnimation(),
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
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => 0,
                child: const Text(
                  "Non hai un account? Iscriviti",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                )
              )
            )
          ]
        )
      )
    );
  }
}