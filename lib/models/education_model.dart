import 'package:flutter/cupertino.dart';

class EducationModel {
  List<EducationModelList> educationModelList = [EducationModelList()];

  List<int> deleted = [];

  Map<String, dynamic> getEducationModel() {
    Map<String, dynamic> educationModelMap = {
      "board": [],
      "passingYear": [],
      "percentage": [],
    };

    for (int i = 0; i < educationModelList.length; i++) {
      educationModelMap['board'].add(educationModelList[i].nameOfBoard.text);
      educationModelMap['passingYear'].add(educationModelList[i].passingYear.text);
      educationModelMap['percentage'].add(educationModelList[i].percentage.text);
    }

    return educationModelMap;
  }

  setEducationData(List<Map<String, dynamic>> result) {
    educationModelList.removeLast();

    for (int i = 0; i < result.length; i++) {
      EducationModelList educationMode = EducationModelList();

      educationMode.nameOfBoard.text = result[i]['board'];
      educationMode.passingYear.text = result[i]['passingYear'].toString();
      educationMode.percentage.text = result[i]['percentage'].toString();
      educationMode.id = result[i]['id'];
      educationMode.eid = result[i]['eid'];

      educationModelList.add(educationMode);
    }
  }

  List<Map<String, dynamic>> jsonEducation() {
    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < educationModelList.length; i++) {
      data.add({
        "board": educationModelList[i].nameOfBoard.text,
        "passingYear": educationModelList[i].passingYear.text,
        "percentage": educationModelList[i].percentage.text,
        "eid": educationModelList[i].eid,
        "id": educationModelList[i].id,
      });
    }

    return data;
  }
}

class EducationModelList {
  TextEditingController nameOfBoard = TextEditingController();
  TextEditingController passingYear = TextEditingController();
  TextEditingController percentage = TextEditingController();
  int eid = -1;
  int id = -1;
}
