import 'package:flutter/cupertino.dart';
import '../screens/homescreen/home_screen.dart';

class Routes {
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> rout = {
    home: (context) => const HomeScreen(),
  };
}
