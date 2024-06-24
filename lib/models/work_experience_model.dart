import 'package:flutter/cupertino.dart';

class WorkExperienceList {
  List<WorkExperience> data = [WorkExperience()];

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
}

class WorkExperience {
  TextEditingController companyName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
}
