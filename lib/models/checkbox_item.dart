import 'package:flutter/material.dart';

class CheckboxItem {
  String? name;
  int? index;
  CheckboxItem({this.name, this.index});
}

class Checkbox {
  List<CheckboxItem> data = [
    CheckboxItem(
      index: 1,
      name: "Beginner",
    ),
    CheckboxItem(
      index: 2,
      name: "Mediator",
    ),
    CheckboxItem(
      index: 3,
      name: "Export",
    ),
  ];
}

class TechnologyModel {
  String techonologyName;
  String know;
  int tid = -1;
  int id = -1;

  TechnologyModel({required this.techonologyName, this.know = ""});
}

class TechnologyModelList {
  List<TechnologyModel> data = [
    TechnologyModel(techonologyName: "Php"),
  ];

  List<int> deleted = [];

  Map<String, dynamic> getTopTechnologyMap() {
    Map<String, dynamic> educationModelMap = {
      "techonologyName": [],
      "know": [],
    };

    for (int i = 0; i < data.length; i++) {
      educationModelMap['techonologyName'].add(data[i].techonologyName);
      educationModelMap['know'].add(data[i].know);
    }

    return educationModelMap;
  }

  setEducationData(List<Map<String, dynamic>> result) {
    data.removeLast();

    for (int i = 0; i < result.length; i++) {
      TechnologyModel educationMode = TechnologyModel(techonologyName: result[i]['techonologyName']);

      educationMode.know = result[i]['know'];
      educationMode.id = result[i]['id'];
      educationMode.tid = result[i]['tid'];

      data.add(educationMode);
    }
  }

  List<Map<String, dynamic>> jsonEducation() {
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < data.length; i++) {
      result.add({
        "techonologyName": data[i].techonologyName,
        "know": data[i].know,
        "tid": data[i].tid,
        "id": data[i].id,
      });
    }

    return result;
  }
}
