import 'package:flutter/material.dart';
import 'package:quix/models/ModelProvider.dart';
import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/screen/app/game_provider.dart';

class CorrectNameProvider extends GameProvider<Question>{

  late String result;

  CorrectNameProvider({required TickerProvider vsync})
      : super(vsync: vsync, gameCategoryType: GameCategoryType.CORRECT_NAME) {
    startGame();
  }

  Future<void> checkResult(String answer) async{

  }

}