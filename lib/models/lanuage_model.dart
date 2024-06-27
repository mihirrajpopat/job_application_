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

  List<int> deleted = [];

  List<Map<String, dynamic>> getLanguageMap() {
    List<Map<String, dynamic>> educationModelMap = [];

    for (int i = 0; i < data.length; i++) {
      List trueKeys = data[i].val.keys.where((key) => data[i].val[key] == true).toList();

      String known = trueKeys.join(",");

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

      educationMode.val['Read'] = result[i]['read'] == 1 ? true : false;
      educationMode.val['Write'] = result[i]['write'] == 1 ? true : false;
      educationMode.val['Speak'] = result[i]['speak'] == 1 ? true : false;
      educationMode.id = result[i]['id'];
      educationMode.lid = result[i]['lid'];

      data.add(educationMode);
    }
  }

  List<Map<String, dynamic>> jsonLanuage() {
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < data.length; i++) {
      result.add({
        "read": data[i].val['Read'] == true ? 1 : 0,
        "write": data[i].val['Write'] == true ? 1 : 0,
        "speak": data[i].val['Speak'] == true ? 1 : 0,
        "language": data[i].languageName,
        "id": data[i].id,
        "lid": data[i].lid
      });
    }

    return result;
  }
}
