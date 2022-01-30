import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/login_info.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/utility/custom_dialogs.dart';

class NotesPreview extends StatelessWidget {
  const NotesPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Anteprima appunti",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _getList(TopicInfo().getTopic()),
          _getButton(context, TopicInfo().getTopic()),
        ],
      ),
    );
  }

  Widget _getButton(BuildContext context, Topic topic) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: TextButton(
          onPressed: () {
            if (UserLogin().getLoginInfo()) {
              CustomDialogs.downloadCompleatedDialog(context, topic);
            } else {
              CustomDialogs.permissionDialog(context);
            }
          },
          child: const Text(
            "Scarica gli appunti completi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getList(Topic topic) {
    switch (topic) {
      case Topic.lock:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/sincronizzazione1.png',
              ),
              Image.asset(
                'assets/images/sincronizzazione2.png',
              ),
            ],
          );
        }
      case Topic.algebra:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/algebra1.png',
              ),
              Image.asset(
                'assets/images/algebra2.png',
              ),
            ],
          );
        }
      case Topic.pdsi:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/Pdsi1.png',
              ),
              Image.asset(
                'assets/images/Pdsi2.png',
              ),
            ],
          );
        }
      case Topic.tipidilock:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/unknown.png',
              ),
              Image.asset(
                'assets/images/unknown1.png',
              ),
            ],
          );
        }
      case Topic.lockduefasi:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/unknown.png',
              ),
              Image.asset(
                'assets/images/unknown1.png',
              ),
            ],
          );
        }
      case Topic.algoritmi:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/algo1.png',
              ),
              Image.asset(
                'assets/images/algo2.png',
              ),
            ],
          );
        }
      case Topic.turing:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/mdt1.png',
              ),
              Image.asset(
                'assets/images/mdt2.png',
              ),
            ],
          );
        }
      case Topic.basi:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/basi1.png',
              ),
              Image.asset(
                'assets/images/basi2.png',
              ),
            ],
          );
        }
      case Topic.prototyping:
        {
          return Column(
            children: <Widget>[
              Image.asset(
                'assets/images/prototyping1.png',
              ),
              Image.asset(
                'assets/images/prototyping2.png',
              ),
            ],
          );
        }
    }
  }
}
