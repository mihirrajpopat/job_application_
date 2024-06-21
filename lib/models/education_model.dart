import 'package:flutter/cupertino.dart';

class EducationModel {
  List<EducationModelList> educationModelList = [EducationModelList()];

  getMapData() {}
}

class EducationModelList {
  TextEditingController nameOfBoard = TextEditingController();
  TextEditingController passingYear = TextEditingController();
  TextEditingController percentage = TextEditingController();
}
