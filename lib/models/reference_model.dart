import 'package:flutter/cupertino.dart';

class ReferenceModelList {
  List<ReferenceModel> data = [ReferenceModel()];
}

class ReferenceModel {
  TextEditingController name = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController relation = TextEditingController();
}
