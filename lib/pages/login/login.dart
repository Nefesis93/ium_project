import 'package:flutter/material.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/utility/custom_animations.dart';
import 'package:ium_project/pages/login/login_dialogs.dart';

/*
schermata di login
*/
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  maxLength: 25,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(),
                    labelText: "User Name",
                    hintText: "Enter valid mail"
                  )
                )
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLength: 20,
                  obscureText: true,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Enter password"
                  )
                )
              ),
              TextButton(
                onPressed: () {
                  LoginDialogs.forgotPasswordDialog(context);
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
      )
    );
  }
}