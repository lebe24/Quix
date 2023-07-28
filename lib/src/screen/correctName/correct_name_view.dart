import 'package:provider/provider.dart';
import 'package:quix/src/core/index.dart';
import 'package:quix/src/data/model/correct_name.dart';
import 'package:quix/src/data/repo/correct_name_repository.dart';
import 'package:quix/src/screen/common/common_info_text_view.dart';
import 'package:quix/src/screen/common/common_number_button.dart';
import 'package:quix/src/screen/common/common_wrong_answer_animation.dart';
import 'package:quix/src/screen/common/dialog_listener.dart';
import 'package:quix/src/screen/correctName/correct_name_provider.dart';
import 'package:quix/src/screen/correctName/correct_name_question.dart';
import 'package:vsync_provider/vsync_provider.dart';
import '../common/common_neumorphic_view.dart';

class CorrectNameView extends StatelessWidget {
  final Tuple2<Color, Color> colorTuple;
  final  isDone = false;

  const CorrectNameView({
    Key? key,
    required this.colorTuple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: CorrectNameRepository().getStuff(),
      builder: (BuildContext context, AsyncSnapshot snapshot)  {
        print(snapshot.data);
        return snapshot.hasData == false ? CircularProgressIndicator() : MultiProvider(
          providers: [
            const VsyncProvider(),
            ChangeNotifierProvider<CorrectNameProvider>(
                create: (context) =>
                    CorrectNameProvider(
                      isDone: isDone ,
                      vsync: VsyncProvider.of(context)))
          ],
          child: WillPopScope(
            onWillPop: () => Future.value(false),
            child: Scaffold(
              // appBar: CommonAppBar<CorrectAnswerProvider>(colorTuple: colorTuple),
              body: SafeArea(
                bottom: true,
                child: DialogListener<CorrectNameProvider>(
                  gameCategoryType: GameCategoryType.CORRECT_NAME,
                  child: Container(
                    margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    constraints: BoxConstraints.expand(),
                    child: Column(
                      children: <Widget>[
                        const CommonInfoTextView<CorrectNameProvider>(
                            gameCategoryType: GameCategoryType.CORRECT_NAME),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Selector<CorrectNameProvider, CorrectName>(
                                  selector: (p0, p1) => p1.currentState,
                                  builder: (context, currentState, child) {
                                    return CorrectNameQuestionView(
                                      question: currentState.question,
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Selector<CorrectNameProvider, CorrectName>(
                            selector: (p0, p1) => p1.currentState,
                            builder: (context, currentState, child) {
                              return GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                padding: const EdgeInsets.only(bottom: 24),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  ...[
                                    currentState.firstAns,
                                    currentState.secondAns,
                                    currentState.thirdAns,
                                    currentState.fourthAns,
                                  ].map(
                                    (e) {
                                      return CommonNumberButton(
                                        text: e,
                                        onTab: () {
                                          context
                                              .read<CorrectNameProvider>()
                                              .checkResult(e);
                                        },
                                        colorTuple: colorTuple,
                                        fontSize: 48,
                                      );
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
    );
  }
}
