import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'package:quix/amplifyconfiguration.dart';
import 'package:quix/models/ModelProvider.dart';
import 'package:quix/src/core/app_route.dart';
import 'package:quix/src/core/app_theme.dart';
import 'package:quix/src/screen/app/theme_provider.dart';
import 'package:quix/src/screen/dashboard/dashboard_view.dart';



class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {

  @override
  void initState() {
    _configureAmplify();
    
    super.initState();
  }

  void _configureAmplify() async {
    try {
      AmplifyDataStore dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
      final api = AmplifyAPI(modelProvider: ModelProvider.instance);
      await Amplify.addPlugins([AmplifyAuthCognito(),api,dataStorePlugin]);
      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured');
    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }

    queryListItems();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider provider, child)  {
        return Authenticator(
          signUpForm: SignUpForm.custom(
          fields: [
              SignUpFormField.username(),
              SignUpFormField.password(),
              SignUpFormField.passwordConfirmation(),
              SignUpFormField.email(),
            ],
          ),
          child: MaterialApp(
            builder: Authenticator.builder(),
            title: 'Math Matrix',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            darkTheme: AppTheme.darkTheme,
            routes: appRoutes,
            home: DashboardView()),
        );
      }
    );
  }
}

Future<List<Question?>> queryListItems() async {
  try {
    final request = ModelQueries.list(Question.classType);
    final response = await Amplify.API.query(request: request).response;

    final todos = response.data?.items;
    final todo = response.data?.items[0];
    final answer = response.data?.items;
    if (todos == null) {
      safePrint('errors: ${response.errors}');
      return const [];
    }
    print({todo});
    return todos;
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
    return const [];
  }
}