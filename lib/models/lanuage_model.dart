import 'package:flutter/cupertino.dart';

class LanguageModel {
  Map val = {
    'Read': false,
    'Write': false,
    'Speak': false,
  };

  String languageName;
  int id = -1;
  int lid = -1;

  LanguageModel({required this.languageName});
}

class LanuageListModel {
  List<LanguageModel> data = [
    LanguageModel(languageName: "gujrati"),
  ];

  List<Map<String, dynamic>> getLanguageMap() {
    List<Map<String, dynamic>> educationModelMap = [];

    for (int i = 0; i < data.length; i++) {
      print(" get data is ${data[i].val}");

      List trueKeys = data[i].val.keys.where((key) => data[i].val[key] == true).toList();
      print(" get set data is ${data[i].val}");
      String known = trueKeys.join(",");

      print(" get set data is ${data[i].val}");

      Map<String, dynamic> educationModelMap1 = {
        "Known": known,
        "languageName": data[i].languageName,
      };

      educationModelMap.add(educationModelMap1);
    }

    return educationModelMap;
  }

  setLanguageData(List<Map<String, dynamic>> result) {
    data.removeLast();

    for (int i = 0; i < result.length; i++) {
      LanguageModel educationMode = LanguageModel(languageName: result[i]['language']);

      educationMode.val['read'] = result[i]['read'] == 1 ? true : false;
      educationMode.val['write'] = result[i]['write'] == 1 ? true : false;
      educationMode.val['speak'] = result[i]['speak'] == 1 ? true : false;
      educationMode.id = result[i]['id'];
      educationMode.lid = result[i]['lid'];

      data.add(educationMode);
    }
  }

  List<Map<String, dynamic>> jsonLanuage() {
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < data.length; i++) {
      print("json data is ${data[i].val['read']}");
      result.add({
        "read": data[i].val['read'] == true ? 1 : 0,
        "write": data[i].val['write'] == true ? 1 : 0,
        "speak": data[i].val['speak'] == true ? 1 : 0,
        "language": data[i].languageName,
        "id": data[i].id,
        "lid": data[i].lid
      });
    }

    return result;
  }
}
