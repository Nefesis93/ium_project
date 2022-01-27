import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/informations/topic_info.dart';
import 'package:ium_project/utility/bars/bars.dart';

import '../appunti_specifici/algebra_page.dart';
import '../appunti_specifici/lock_page.dart';

class Appunti extends StatelessWidget {
  const Appunti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const DefaultBottomBar(),
        floatingActionButton: const FloatingPlusButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _getList(TopicInfo().getTopic(), context),
    );
  }

  Widget _getList(Topic topic, BuildContext context) {
    switch(topic) {
      case Topic.lock: {
        return const LockPage();
      }
      case Topic.algebra: {
        return const AlgebraPage();
      }
    }
  }
}
