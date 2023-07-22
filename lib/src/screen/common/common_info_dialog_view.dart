import 'package:quix/src/core/color_scheme.dart';
import 'package:quix/src/core/index.dart';
import 'package:quix/src/data/model/game_info_dialog.dart';
import 'package:quix/src/utility/dialog_info_util.dart';

class CommonInfoDialogView extends StatelessWidget {
  final GameCategoryType gameCategoryType;

  const CommonInfoDialogView({
    required this.gameCategoryType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameInfoDialog gameInfoDialog =
        DialogInfoUtil.getInfoDialogData(gameCategoryType);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            gameInfoDialog.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 18),
          ),
          SizedBox(height: 24),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.dialogGifBgColor,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              child: Image.asset(
                gameInfoDialog.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              gameInfoDialog.dec,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${gameInfoDialog.correctAnswerScore}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${gameInfoDialog.wrongAnswerScore}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "for correct answer",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "for wrong answer",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    width: 164,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffF48C06), Color(0xffD00000)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text("GOT IT!",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 18, color: Colors.white))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
