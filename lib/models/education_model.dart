import 'package:flutter/cupertino.dart';

class EducationModel {
  List<EducationModelList> educationModelList = [EducationModelList()];

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
}

class EducationModelList {
  TextEditingController nameOfBoard = TextEditingController();
  TextEditingController passingYear = TextEditingController();
  TextEditingController percentage = TextEditingController();
}
