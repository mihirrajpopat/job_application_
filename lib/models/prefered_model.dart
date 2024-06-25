import 'package:flutter/cupertino.dart';

class PreferedModel {
  TextEditingController noticePeriod = TextEditingController();
  TextEditingController expectedCtc = TextEditingController();
  TextEditingController currentCtc = TextEditingController();

  String department;
  String selectedPreferedLocation;

  int pid = -1;
  int id = 0;

  PreferedModel({
    this.selectedPreferedLocation = "Gujrat",
    this.department = "Single",
  });

  Map<String, dynamic> getPreferenceData() {
    Map<String, dynamic> preferenceData = {
      "noticePerirod": noticePeriod.text,
      "expectedCtc": expectedCtc.text,
      "currentCtc": currentCtc.text,
      "department": department,
      "preferdLocation": selectedPreferedLocation,
    };

    return preferenceData;
  }

  setPreferenceData(List<Map<String, dynamic>> result) {
    noticePeriod.text = result[0]['noticePerirod'];
    expectedCtc.text = result[0]['expectedCtc'].toString();
    currentCtc.text = result[0]['currentCtc'].toString();
    department = result[0]['department'];
    selectedPreferedLocation = result[0]['preferdLocation'];
    id = result[0]['id'];
  }

  Map<String, dynamic> PreferedModelMap() {
    Map<String, dynamic> data = {
      "noticePerirod": noticePeriod.text,
      "expectedCtc": expectedCtc.text,
      "currentCtc": currentCtc.text,
      "department": department,
      "preferdLocation": selectedPreferedLocation
    };
    return data;
  }
}
