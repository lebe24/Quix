import 'package:quix/src/core/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  final SharedPreferences sharedPreferences;

  ThemeProvider({required this.sharedPreferences}) {
    themeMode =
        ThemeMode.values[sharedPreferences.getInt(KeyUtil.IS_DARK_MODE) ?? 2];
  }

  void changeTheme() async {
    if (themeMode == ThemeMode.light)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
    notifyListeners();
    await sharedPreferences.setInt(KeyUtil.IS_DARK_MODE, themeMode.index);
  }
}
