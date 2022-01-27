import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/pages/appunti/appunti_utility.dart';

class LockDueFasiPage extends StatelessWidget {
  const LockDueFasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppuntiUtility.getBody(context, Topic.lockduefasi);
  }
}
