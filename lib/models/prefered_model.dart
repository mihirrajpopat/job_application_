import 'package:flutter/cupertino.dart';

class PreferedModel {
  TextEditingController noticePeriod = TextEditingController();
  TextEditingController expectedCtc = TextEditingController();
  TextEditingController currentCtc = TextEditingController();

  String department;
  String selectedPreferedLocation;

  PreferedModel({
    this.selectedPreferedLocation = "Gujrat",
    this.department = "Single",
  });

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
