import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quix/models/ModelProvider.dart';
import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/screen/common/dialog_listener.dart';
import 'package:quix/src/screen/correctName/correct_name_provider.dart';
import 'package:quix/src/screen/correctName/correct_name_question.dart';
import 'package:vsync_provider/vsync_provider.dart';

class CorrectNameView extends StatelessWidget {
  const CorrectNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        const VsyncProvider(),
        ChangeNotifierProvider<CorrectNameProvider>(create: (context) => CorrectNameProvider(vsync: VsyncProvider.of(context)))
      ],
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: SafeArea(
            bottom: true,
            child: DialogListener<CorrectNameProvider>(
              gameCategoryType: GameCategoryType.CORRECT_NAME,
              child: Container(
                margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
                constraints: const BoxConstraints.expand(),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Selector<CorrectNameProvider,Question>(
                            selector: (p0, p1) => p1.currentState,
                            builder: (context, currentState, child){
                              return CorrectNameQuestionView(
                                
                              );
                            }, 
                            
                            )
                        ],
                  ))
                ]),
              ),
            )
          ),
        ),
      ),
    );
  }
}