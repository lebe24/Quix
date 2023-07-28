import 'package:provider/provider.dart';
import 'package:quix/src/core/index.dart';
import 'package:quix/src/data/model/quick_calculation.dart';
import 'package:quix/src/screen/common/common_back_button.dart';
import 'package:quix/src/screen/common/common_clear_button.dart';
import 'package:quix/src/screen/common/common_info_text_view.dart';
import 'package:quix/src/screen/common/common_neumorphic_view.dart';
import 'package:quix/src/screen/common/common_number_button.dart';
import 'package:quix/src/screen/common/common_wrong_answer_animation.dart';
import 'package:quix/src/screen/common/dialog_listener.dart';
import 'package:quix/src/screen/quickCalculation/quick_calculation_provider.dart';
import 'package:quix/src/screen/quickCalculation/quick_calculation_question_view.dart';
import 'package:vsync_provider/vsync_provider.dart';

class QuickCalculationView extends StatelessWidget {
  final Tuple2<Color, Color> colorTuple;

  const QuickCalculationView({
    Key? key,
    required this.colorTuple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        const VsyncProvider(),
        ChangeNotifierProvider<QuickCalculationProvider>(
            create: (context) =>
                QuickCalculationProvider(vsync: VsyncProvider.of(context)))
      ],
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: SafeArea(
            bottom: true,
            child: DialogListener<QuickCalculationProvider>(
              gameCategoryType: GameCategoryType.QUICK_CALCULATION,
              child: Container(
                margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                constraints: BoxConstraints.expand(),
                child: Column(
                  children: <Widget>[
                    CommonInfoTextView<QuickCalculationProvider>(
                        gameCategoryType: GameCategoryType.QUICK_CALCULATION),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NEXT",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 10),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 72,
                                  child: Selector<
                                      QuickCalculationProvider,
                                      Tuple3<QuickCalculation, QuickCalculation,
                                          QuickCalculation?>>(
                                    selector: (p0, p1) => Tuple3(
                                        p1.currentState,
                                        p1.nextCurrentState,
                                        p1.previousCurrentState),
                                    builder: (context, tuple3, child) {
                                      return QuickCalculationQuestionView(
                                        currentState: tuple3.item1,
                                        nextCurrentState: tuple3.item2,
                                        previousCurrentState: tuple3.item3,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                " = ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 30),
                              ),
                              SizedBox(width: 6),
                              Selector<QuickCalculationProvider,
                                  Tuple2<double, double>>(
                                selector: (p0, p1) =>
                                    Tuple2(p1.currentScore, p1.oldScore),
                                builder: (context, tuple2, child) {
                                  return CommonWrongAnswerAnimationView(
                                    currentScore: tuple2.item1.toInt(),
                                    oldScore: tuple2.item2.toInt(),
                                    child: child!,
                                  );
                                },
                                child: CommonNeumorphicView(
                                  child: Selector<QuickCalculationProvider,
                                          String>(
                                      selector: (p0, p1) => p1.result,
                                      builder: (context, result, child) {
                                        return Text(result,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    fontSize: 24,
                                                    color: colorTuple.item1));
                                      }),
                                ),
                              ),
                              SizedBox(width: 60),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Builder(builder: (context) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        padding: const EdgeInsets.only(bottom: 24),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ...[
                            "7",
                            "8",
                            "9",
                            "4",
                            "5",
                            "6",
                            "1",
                            "2",
                            "3",
                            "Clear",
                            "0",
                            "Back"
                          ].map(
                            (e) {
                              if (e == "Clear") {
                                return CommonClearButton(
                                    text: "Clear",
                                    onTab: () {
                                      context
                                          .read<QuickCalculationProvider>()
                                          .clearResult();
                                    });
                              } else if (e == "Back") {
                                return CommonBackButton(onTab: () {
                                  context
                                      .read<QuickCalculationProvider>()
                                      .backPress();
                                });
                              } else {
                                return CommonNumberButton(
                                  text: e,
                                  onTab: () {
                                    context
                                        .read<QuickCalculationProvider>()
                                        .checkResult(e);
                                  },
                                  colorTuple: colorTuple,
                                );
                              }
                            },
                          )
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
