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
