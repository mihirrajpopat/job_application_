import 'package:flutter/cupertino.dart';
import '../screens/homescreen/home_screen.dart';
import '../screens/preview_screen.dart';

class Routes {
  static const String home = '/home';
  static const String previewScreen = '/PreviewScreen';

  static Map<String, Widget Function(BuildContext)> rout = {
    home: (context) => const HomeScreen(),
    previewScreen: (context) => const PreviewScreen(),
  };
}
