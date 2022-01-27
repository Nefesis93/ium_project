import 'package:flutter/material.dart';
import 'package:ium_project/enums/topic.dart';
import '../appunti_utility.dart';

class AlgebraPage extends StatelessWidget {
  const AlgebraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppuntiUtility.getBody(context, Topic.algebra);
  }
}