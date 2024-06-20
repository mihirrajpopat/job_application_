import 'package:flutter/cupertino.dart';

class BasicDetailModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  String radioGenderValue;
  String selectedStateItem;
  String selectedReletionItem;
  int grpId;

  BasicDetailModel(
      {this.radioGenderValue = "male",
      this.selectedReletionItem = "single",
      this.selectedStateItem = "gujrat",
      this.grpId = 1});
}
