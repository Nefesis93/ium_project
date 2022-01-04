import 'package:flutter/material.dart';

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
                onPressed: () => 0,
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