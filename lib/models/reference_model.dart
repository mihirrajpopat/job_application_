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

  List<Map<String, dynamic>> jsonReference() {
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < data.length; i++) {
      result.add({
        "name": data[i].name.text,
        "contectNumber": data[i].contactNumber.text,
        "relation": data[i].relation.text,
        "id": data[i].id,
        "rid": data[i].rid,
      });
    }

    return result;
  }

  setWorkExperienceDetails(List<Map<String, dynamic>> result) {
    data.removeLast();

    for (int i = 0; i < result.length; i++) {
      ReferenceModel referenceModel = ReferenceModel();
      referenceModel.name.text = result[i]['name'];
      referenceModel.contactNumber.text = result[i]['contectNumber'];
      referenceModel.relation.text = result[i]['relation'];
      referenceModel.id = result[i]['id'];
      referenceModel.rid = result[i]['rid'];

      data.add(referenceModel);
    }
  }
}

class ReferenceModel {
  TextEditingController name = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController relation = TextEditingController();
  int id = -1;
  int rid = -1;
}
