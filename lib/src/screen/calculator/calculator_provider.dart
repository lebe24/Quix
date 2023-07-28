import 'dart:async';
import 'package:quix/src/core/index.dart';
import 'package:quix/src/data/model/calculator.dart';
import 'package:quix/src/screen/app/game_provider.dart';


class CalculatorProvider extends GameProvider<Calculator> {
  late String result;

  CalculatorProvider({required TickerProvider vsync})
      : super(vsync: vsync,gameCategoryType: GameCategoryType.CALCULATOR) {
    startGame();
  }

  void checkResult(String answer) async {
    if (result.length < currentState!.answer.toString().length &&
        timerStatus != TimerStatus.pause) {
      result = result + answer;
      notifyListeners();
      if (int.parse(result) == currentState!.answer) {
        await Future.delayed(Duration(milliseconds: 300));
        loadNewDataIfRequired();
        if (timerStatus != TimerStatus.pause) {
          restartTimer();
        }
        notifyListeners();
      } else if (result.length == currentState!.answer.toString().length) {
        wrongAnswer();
      }
    }
  }

  void backPress() {
    if (result.length > 0) {
      result = result.substring(0, result.length - 1);
      notifyListeners();
    }
  }

  void clearResult() {
    result = "";
    notifyListeners();
  }
}
