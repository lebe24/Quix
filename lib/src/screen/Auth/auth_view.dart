import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
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
import 'package:quix/src/data/services/api_service.dart';
import 'package:quix/src/screen/app/theme_provider.dart';
import 'package:quix/src/screen/dashboard/dashboard_view.dart';



class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {

  APIService _apiService = APIService();

  @override
  void initState() {
  _configureAmplify();
    super.initState();
  }

  void _configureAmplify() async {
    try {

      final auth = AmplifyAuthCognito();
      final api = AmplifyAPI(modelProvider: ModelProvider.instance);
      final analyticsPlugin = AmplifyAnalyticsPinpoint();
      await Amplify.addPlugins([auth,api,analyticsPlugin]);
      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured');
      _apiService.recordSignin();

    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }

}


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return 
       Authenticator(
          signUpForm: SignUpForm.custom(
          fields: [
              SignUpFormField.username(),
              SignUpFormField.password(),
              SignUpFormField.passwordConfirmation(),
              SignUpFormField.email(),
            ],
          ),
          child: Consumer<ThemeProvider>(
            builder: (context, ThemeProvider provider, child) {

              return MaterialApp(
                builder: Authenticator.builder(),
                title: 'Math Matrix',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.theme,
                themeMode: provider.themeMode,
                darkTheme: AppTheme.darkTheme,
                routes: appRoutes,
                home: DashboardView());
            }
          ),
        );
  }
}

