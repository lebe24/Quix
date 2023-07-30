import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/data/repo/square_root.dart';
import 'package:quix/src/screen/app/game_provider.dart';


class SquareRootProvider extends GameProvider<SquareRoot> {
  SquareRootProvider({required TickerProvider vsync})
      : super(vsync: vsync, gameCategoryType: GameCategoryType.SQUARE_ROOT) {
    startGame();
  }

  Future<void> checkResult(String answer) async {
    if (int.parse(answer) == currentState.answer &&
        timerStatus != TimerStatus.pause) {
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
