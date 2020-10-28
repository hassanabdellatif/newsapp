
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn");
  if (isLoggedIn == null || isLoggedIn == false) {
    return false;
  } else {
    return true;
  }
}
