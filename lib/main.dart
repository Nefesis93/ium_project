import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUM Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInPage(),
    );
  }
}

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "User Name",
                  hintText: "Enter valid mail"
                )
              )
            ),
            Padding(
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
            FlatButton(
              onPressed: () => 0,
              child: Text(
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
              child: FlatButton(
                onPressed: () => 0,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 25)
                )
              )
            )
          ]
        )
      )
    );
  }
}