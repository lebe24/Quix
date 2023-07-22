import 'package:flutter/material.dart';
import 'package:quix/models/ModelProvider.dart';

class CorrectNameQuestionView extends StatelessWidget {
  final Question question;
  final Widget questionView;

  const CorrectNameQuestionView({super.key, required this.question, required this.questionView});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('name of the person',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 30),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Text(question.Text.toString()),
        )
      ],
    );
  }
}