import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:quix/src/core/app_assets.dart';
import 'package:quix/src/core/index.dart';
import 'package:quix/src/data/repo/square_root.dart';
import 'package:quix/src/screen/common/common_info_text_view.dart';
import 'package:quix/src/screen/common/common_number_button.dart';
import 'package:quix/src/screen/common/dialog_listener.dart';
import 'package:quix/src/screen/squareRoot/square_root_provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

class SquareRootView extends StatelessWidget {
  final Tuple2<Color, Color> colorTuple;

  const SquareRootView({
    Key? key,
    required this.colorTuple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        const VsyncProvider(),
        ChangeNotifierProvider<SquareRootProvider>(
            create: (context) =>
                SquareRootProvider(vsync: VsyncProvider.of(context)))
      ],
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: SafeArea(
            bottom: true,
            child: DialogListener<SquareRootProvider>(
              gameCategoryType: GameCategoryType.SQUARE_ROOT,
              child: Container(
                margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
                constraints: const BoxConstraints.expand(),
                child: Column(
                  children: <Widget>[
                   const CommonInfoTextView<SquareRootProvider>(
                        gameCategoryType: GameCategoryType.SQUARE_ROOT),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.icRoot,
                            height: 40,
                            color: colorTuple.item1,
                          ),
                          Selector<SquareRootProvider, SquareRoot>(
                              selector: (p0, p1) => p1.currentState,
                              builder: (context, currentState, child) {
                                return Text(
                                  currentState.question,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 40),
                                );
                              }),
                        ],
                      ),
                    ),
                    Selector<SquareRootProvider, SquareRoot>(
                      selector: (p0, p1) => p1.currentState,
                      builder: (context, currentState, child) {
                        return GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          padding: const EdgeInsets.only(bottom: 24),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                        .read<SquareRootProvider>()
                                        .checkResult(e);
                                  },
                                  colorTuple: colorTuple,
                                  fontSize: 48,
                                );
                              },
                            )
                          ],
                        );
                      },
                    ),
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
