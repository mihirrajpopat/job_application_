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
  //  = {"mihir": "hello", "mishan": "hello"};

  BasicDetailModel(
      {this.radioGenderValue = " ",
      this.selectedReletionItem = "Single",
      this.selectedStateItem = "Gujrat",
      this.grpId = 1});

  Map<String, String> getBasicDetails() {
    Map<String, String> basicDetailsMap = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "designation": designation.text,
      "address": designation.text,
      "email": address.text,
      "phoneNumber": phoneNumber.text,
      "zipCode": zipCode.text,
      "dateOfBirth": dateOfBirth.text,
      "gender": radioGenderValue,
      "state": selectedStateItem,
      "relation": selectedReletionItem,
    };

    return basicDetailsMap;
  }
}
