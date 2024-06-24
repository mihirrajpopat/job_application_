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

class TechnologyYouKnowModel {
  List<Checkbox> checkbox = [Checkbox(), Checkbox(), Checkbox(), Checkbox()];

  List<String> technology = ["PHP", "MySql", "Laravel", "Oracle"];
}

class TechnologyModel {
  String techonologyName;
  String know;

  TechnologyModel({required this.techonologyName, this.know = ""});
}

class TechnologyModelList {
  List<TechnologyModel> data = [
    TechnologyModel(techonologyName: "Php"),
    TechnologyModel(techonologyName: "MySql"),
    TechnologyModel(techonologyName: "Laravel"),
    TechnologyModel(techonologyName: "Oracle")
  ];

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
}
