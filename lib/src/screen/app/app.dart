import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quix/src/core/app_constant.dart';
import 'package:quix/src/core/app_route.dart';
import 'package:quix/src/core/app_theme.dart';
import 'package:quix/src/screen/app/theme_provider.dart';

class App extends StatelessWidget {
  final String fontFamily = "Montserrat";

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider provider, child) {
      return MaterialApp(
        builder: Authenticator.builder(),
        title: 'Math Matrix',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: provider.themeMode,
        initialRoute: KeyUtil.splash,
        routes: appRoutes,
        
      );
    });
  }
}