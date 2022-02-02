import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/algoritmi_page.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/basi_page.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/lockduefasi_page.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/pdsi_page.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/prototyping_page.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/tipidilock_page.dart';
import 'package:ium_project/pages/appunti/appunti_specifici/turing_page.dart';
import 'package:ium_project/utility/bars/bars.dart';

import '../appunti_specifici/algebra_page.dart';
import '../appunti_specifici/lock_page.dart';

class Appunti extends StatelessWidget {
  const Appunti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getList(TopicInfo().getTopic(), context),
    );
  }

  Widget _getList(Topic topic, BuildContext context) {
    switch (topic) {
      case Topic.lock:
        {
          return const LockPage();
        }
      case Topic.algebra:
        {
          return const AlgebraPage();
        }
      case Topic.pdsi:
        {
          return const PdsiPage();
        }
      case Topic.tipidilock:
        {
          return const TipiDiLockPage();
        }
      case Topic.lockduefasi:
        {
          return const LockDueFasiPage();
        }
      case Topic.algoritmi:
        {
          return const AlgoritmiPage();
        }
      case Topic.turing:
        {
          return const TuringPage();
        }
      case Topic.basi:
        {
          return const BasiPage();
        }
      case Topic.prototyping:
        {
          return const PrototypingPage();
        }
    }
  }
}
