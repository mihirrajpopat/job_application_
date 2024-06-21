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
}
