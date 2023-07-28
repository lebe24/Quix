import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:quix/models/ModelProvider.dart';

class APIService {

  Future<List<Question?>> getQuestion() async {
  try {
    final request = ModelQueries.list(Question.classType );
    final response = await Amplify.API.query(request: request).response;

    final items = response.data?.items;
    if (items == null) {
      safePrint('errors: ${response.errors}');
      return <Question?>[];
    }
    safePrint(items);
    return items;
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
  }
    return <Question?>[];
  }

  Future<void> recordSignin() async {
    final event = AnalyticsEvent('User sign in');

    event.customProperties
      ..addStringProperty('Channel', 'SMS')
      ..addBoolProperty('Successful', true);

    // You can also add the properties one by one like the following
    event.customProperties.addIntProperty('ProcessDuration', 792);
    event.customProperties.addDoubleProperty('doubleKey', 120.3);

    await Amplify.Analytics.recordEvent(event: event);
  }

  Future<void> recorduserSelect() async{

  }
}
