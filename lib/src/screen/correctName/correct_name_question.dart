import 'package:flutter/material.dart';
import 'package:quix/src/data/repo/correct_name_repository.dart';

class CorrectNameQuestionView extends StatefulWidget {
  final String question;
  

   const CorrectNameQuestionView({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  State<CorrectNameQuestionView> createState() => _CorrectNameQuestionViewState();
}

class _CorrectNameQuestionViewState extends State<CorrectNameQuestionView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Image.network(
        'https://www.moviepostersgallery.com/wp-content/uploads/2020/08/Blackwidow2.jpg',
        height: 300,
      ),
    );
  }
}