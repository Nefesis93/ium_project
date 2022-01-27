import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/pages/appunti/appunti_utility.dart';

class AlgoritmiPage extends StatelessWidget {
  const AlgoritmiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppuntiUtility.getBody(context, Topic.algoritmi);
  }
}
