import 'package:quix/src/core/index.dart';
import 'package:quix/src/screen/correctAnswer/correct_answer_view.dart';
import 'package:quix/src/screen/correctName/correct_name_view.dart';
import 'package:quix/src/screen/guessTheSign/guess_sign_view.dart';
import 'package:quix/src/screen/profile/profile_view.dart';
import 'package:quix/src/screen/quickCalculation/quick_calculation_view.dart';
import 'package:quix/src/screen/squareRoot/square_root_view.dart';


var appRoutes = {
  KeyUtil.dashboard: (context) =>  DashboardView(),
  KeyUtil.splash: (context) => const SplashView(),
  KeyUtil.auth : (context) => const AuthView(),
  KeyUtil.profile : (context) => const ProfileView(),
  KeyUtil.home: (context) => HomeView(tuple2: ModalRoute.of(context)?.settings.arguments as Tuple2<Dashboard, double>),
  KeyUtil.calculator: (context) => CalculatorView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple2<Color, Color>),
  KeyUtil.guessSign: (context) => GuessSignView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple2<Color, Color>),
  KeyUtil.correctAnswer: (context) => CorrectAnswerView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple2<Color, Color>),
  KeyUtil.correctName: (context) => CorrectNameView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple2<Color, Color>),
  KeyUtil.quickCalculation: (context) => QuickCalculationView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple2<Color, Color>),
  KeyUtil.squareRoot: (context) => SquareRootView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple2<Color, Color>),
};