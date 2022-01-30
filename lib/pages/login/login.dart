import 'package:flutter/material.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/pages/login/login_dialogs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
                    child: SizedBox(
                        width: 350,
                        child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 25,
                            decoration: const InputDecoration(
                                counterText: "",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                labelText: "User Name",
                                hintText: "Enter valid mail"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                          controller: _passwordController,
                          maxLength: 20,
                          obscureText: true,
                          decoration: const InputDecoration(
                              counterText: "",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Enter password")),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        LoginDialogs.forgotPasswordDialog(context);
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      )),
                  Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            if (password != "" && email != "") {
                              UserLogin().login();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25)))),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                          onPressed: () => 0,
                          child: const Text(
                            "Non hai un account? Iscriviti",
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          )))
                ]),
              ),
            )));
  }
}

/*
schermata di login

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
              centerTitle: true,
              title: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
                    child: SizedBox(
                        width: 350,
                        child: TextField(
                            maxLength: 25,
                            decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                                labelText: "User Name",
                                hintText: "Enter valid mail"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                          maxLength: 20,
                          obscureText: true,
                          decoration: InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Enter password")),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        LoginDialogs.forgotPasswordDialog(context);
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      )),
                  Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            UserLogin().login();
                            Navigator.pop(context);
                            //Navigator.of(context).pushReplacement(
                            //  MyAnimations.homeAnimation(),
                            //);
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25)))),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                          onPressed: () => 0,
                          child: const Text(
                            "Non hai un account? Iscriviti",
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          )))
                ]),
              ),
            )));
  }
}*/
