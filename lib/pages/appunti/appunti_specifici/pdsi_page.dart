import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import 'package:ium_project/pages/appunti/appunti_utility.dart';

class PdsiPage extends StatelessWidget {
  const PdsiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppuntiUtility.getBody(context, Topic.pdsi);
  }
}
