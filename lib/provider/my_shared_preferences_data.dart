import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefs extends ChangeNotifier {
  String playerName = 'playerName';

  setName(String name) async {
    playerName = name;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("playerName", name);
    notifyListeners();
  }

  String getName() {
    return playerName;
  }

  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString("playerName");

    name ??= "playerName";
    playerName = name;

    print(playerName);
    notifyListeners();
  }
}
