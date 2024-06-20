import 'package:flutter/cupertino.dart';

class ReferenceModelList {
  List<ReferenceModel> data = [];

  ReferenceModelList({required this.data});
}

class ReferenceModel {
  TextEditingController name = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController relation = TextEditingController();
}
