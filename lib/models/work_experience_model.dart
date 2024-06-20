import 'package:flutter/cupertino.dart';

class WorkExperienceList {
  List<WorkExperience> data = [];

  WorkExperienceList({required this.data});
}

class WorkExperience {
  TextEditingController companyName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
}
