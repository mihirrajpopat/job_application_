import 'package:flutter/cupertino.dart';

class LanguageModel {
  List<Map> val = [
    {
      'Read': false,
      'Write': false,
      'Speak': false,
    },
    {
      'Read': false,
      'Write': false,
      'Speak': false,
    },
    {
      'Read': false,
      'Write': false,
      'Speak': false,
    }
  ];

  Map data = {
    'Read': false,
    'Write': false,
    'Speak': false,
  };

  List language = ["hindi", "english", "gujrati"];

  TextEditingController newLanguage = TextEditingController();
}
