import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/data/model/score_board.dart';

class GameCategory {
  int id;
  String name;
  String key;
  GameCategoryType gameCategoryType;
  String routePath;
  ScoreBoard scoreboard;
  String icon;

  GameCategory(
    this.id,
    this.name,
    this.key,
    this.gameCategoryType,
    this.routePath,
    this.scoreboard,
    this.icon,
  );
}