import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:quix/src/data/model/correct_name.dart';
import 'package:quix/src/data/services/api_service.dart';

class CorrectNameRepository {
  static List<String> listHasCode = <String>[];
  final APIService _apiService = APIService();
  late dynamic question;

  dynamic getCorrectNameDataList(int level) async {
    List<CorrectName> list = <CorrectName>[];

    if (level == 1) {
      listHasCode.clear();
    }


    // safePrint(question[1].Answers[0].toString());

    List<CorrectName> questionList = (question as List<dynamic>).map((item) => CorrectName(
      question: item.Text?.toString() ?? "x",
      firstAns: item.Answers?[0]?.toString() ?? "x",
      secondAns: item.Answers?[1]?.toString() ?? "x",
      thirdAns: item.Answers?[2]?.toString()?? "x",
      fourthAns: item.Answers?[3]?.toString()?? "x",
      answer: item.AcceptedAns?.toString() ?? "2",
    )).toList();

    list.addAll(questionList);

    return true;
  }

  dynamic getStuff() async{
    question = await _apiService.getQuestion();
    safePrint(question[0].Text.toString());
  }
}
