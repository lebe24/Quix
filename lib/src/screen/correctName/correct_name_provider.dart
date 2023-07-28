import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/data/model/correct_name.dart';
import 'package:quix/src/screen/app/game_provider.dart';


class CorrectNameProvider extends GameProvider<CorrectName> {
  late String result;
  bool isDone = false;

  CorrectNameProvider({required TickerProvider vsync, required this.isDone})
      : super(vsync: vsync, gameCategoryType: GameCategoryType.CORRECT_NAME) {
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
