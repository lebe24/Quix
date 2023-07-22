import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:quix/models/ModelProvider.dart';
import 'package:quix/src/screen/Auth/auth_view.dart';
import 'package:quix/src/screen/app/app.dart';
import 'package:quix/src/screen/app/theme_provider.dart';
import 'package:quix/src/screen/dashboard/dashboard_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  setupServiceLocator(sharedPreferences);


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(sharedPreferences: sharedPreferences),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => GetIt.I.get<DashboardProvider>(),
        ),
      ],
      child: const AuthView(),
    ),
  );
}

setupServiceLocator(SharedPreferences sharedPreferences) {
  GetIt.I.registerSingleton<DashboardProvider>(
      DashboardProvider(preferences: sharedPreferences));
}

Future<List<Question?>> queryListItems() async {
  try {
    final request = ModelQueries.list(Question.classType);
    final response = await Amplify.API.query(request: request).response;

    final todos = response.data?.items;
    if (todos == null) {
      safePrint('errors: ${response.errors}');
      return const [];
    }
    print(todos);
    return todos;
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
    return const [];
  }
}

