import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/data/model/correct_answer.dart';
import 'package:quix/src/screen/app/game_provider.dart';


class CorrectAnswerProvider extends GameProvider<CorrectAnswer> {
  late String result;

  CorrectAnswerProvider({required TickerProvider vsync})
      : super(vsync: vsync, gameCategoryType: GameCategoryType.CORRECT_ANSWER) {
    startGame();
  }

  Future<void> checkResult(String answer) async {
    if (timerStatus != TimerStatus.pause) {
      result = answer;
      notifyListeners();
      if (int.parse(result) == currentState.answer) {
        await Future.delayed(Duration(milliseconds: 300));
        loadNewDataIfRequired();
        if (timerStatus != TimerStatus.pause) {
          restartTimer();
        }
        notifyListeners();
      } else {
        wrongAnswer();
      }
    }
  }
}
