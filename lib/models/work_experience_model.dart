import 'package:flutter/cupertino.dart';

class WorkExperienceList {
  List<WorkExperience> data = [WorkExperience()];
  List<int> deleted = [];

  Map<String, dynamic> getWorkExperienceMap() {
    Map<String, dynamic> educationModelMap = {
      "companyName": [],
      "designation": [],
      "fromDate": [],
      "toDate": [],
    };

    for (int i = 0; i < data.length; i++) {
      educationModelMap['companyName'].add(data[i].companyName.text);
      educationModelMap['designation'].add(data[i].designation.text);
      educationModelMap['fromDate'].add(data[i].fromDate.text);
      educationModelMap['toDate'].add(data[i].toDate.text);
    }

    return educationModelMap;
  }

  List<Map<String, dynamic>> jsonWork() {
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < data.length; i++) {
      result.add({
        "companyName": data[i].companyName.text,
        "designation": data[i].designation.text,
        "fromDate": data[i].fromDate.text,
        "toDate": data[i].toDate.text,
        "id": data[i].id,
        "wid": data[i].wid,
      });
    }

    return result;
  }

  setWorkExperienceDetails(List<Map<String, dynamic>> result) {
    data.removeLast();

    for (int i = 0; i < result.length; i++) {
      WorkExperience workExperience = WorkExperience();

      workExperience.companyName.text = result[i]['companyName'];
      workExperience.designation.text = result[i]['designation'];
      workExperience.fromDate.text = result[i]['fromDate'];
      workExperience.toDate.text = result[i]['toDate'];
      workExperience.id = result[i]['id'];

      workExperience.wid = result[i]['wid'];

      data.add(workExperience);
    }
  }
}

class WorkExperience {
  TextEditingController companyName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  int id = -1;
  int wid = -1;
}
