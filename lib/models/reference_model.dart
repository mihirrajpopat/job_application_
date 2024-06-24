import 'package:flutter/cupertino.dart';

class ReferenceModelList {
  List<ReferenceModel> data = [ReferenceModel()];

  Map<String, dynamic> getReferenceMap() {
    Map<String, dynamic> educationModelMap = {
      "name": [],
      "contectNumber": [],
      "relation": [],
    };

    for (int i = 0; i < data.length; i++) {
      educationModelMap['name'].add(data[i].name.text);
      educationModelMap['contectNumber'].add(data[i].contactNumber.text);
      educationModelMap['relation'].add(data[i].relation.text);
    }

    return educationModelMap;
  }
}

class ReferenceModel {
  TextEditingController name = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController relation = TextEditingController();
}
