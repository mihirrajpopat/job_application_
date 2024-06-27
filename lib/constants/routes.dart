import 'package:flutter/cupertino.dart';
import '../screens/homescreen/home_screen.dart';
import '../screens/homescreen/subforms/listing_data.dart';
import '../screens/preview_screen.dart';

class Routes {
  static const String home = '/home';
  static const String previewScreen = '/PreviewScreen';
  static const String listingScreen = '/listingScreen';

  static Map<String, Widget Function(BuildContext)> rout = {
    home: (context) => const HomeScreen(),
    listingScreen: (context) => const ListingData(),
  };
}
