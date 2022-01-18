import 'package:flutter/material.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/utility/custom_dialogs.dart';
import 'package:ium_project/pages/settings_information/settings_information.dart';
import 'package:ium_project/pages/settings/settings_dialogs.dart';


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Impostazioni",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children:  <Widget>[
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: TextButton(
              onPressed: () {
                //inserire cambia password
                if (UserLogin().getLoginInfo()) {
                  SettingsDialogs.changePasswordDialog(context);
                } else {
                  MyDialogs.permissionDialog(context);
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 20, 235, 20),
              ),
              child: const Text(
                "Cambia Password",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 60, 
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsInformation())
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 20, 279, 20),
              ),
              child: const Text(
                "Informazioni",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 60, 
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
            child: TextButton(
              onPressed: () {
                if (UserLogin().getLoginInfo()) {
                  //popup di conferma
                  SettingsDialogs.confirmLogoutDialog(context);
                } else {
                  //popup gia loggato
                  SettingsDialogs.alreadyLogoutDialog(context);
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(10, 20, 348, 20),
              ),
              child: const Text(
                "Esci",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}