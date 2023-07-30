import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:quix/amplifyconfiguration.dart';
import 'package:quix/models/ModelProvider.dart';

class APIService {

  Future<void>  configureAmplify() async{
    final auth = AmplifyAuthCognito();
    final analyticsPlugin = AmplifyAnalyticsPinpoint();
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);

    try{
      await Amplify.addPlugins([auth,api,analyticsPlugin]);
      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured');
      recordSignin();
    }on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

  Future<void> updateScore(Score score) async{
    try{
      final request = ModelMutations.update(score);
      await Amplify.API.mutate(request: request).response;
    }on ApiException catch (e) {
      safePrint('update failed: $e');
    }
  }

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
