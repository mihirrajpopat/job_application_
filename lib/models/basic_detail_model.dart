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
  int id = -1;

  int grpId;
  //  = {"mihir": "hello", "mishan": "hello"};

  BasicDetailModel(
      {this.radioGenderValue = "Male",
      this.selectedReletionItem = "Single",
      this.selectedStateItem = "Gujrat",
      this.grpId = 1});

  Map<String, String> getBasicDetails() {
    Map<String, String> basicDetailsMap = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "designation": designation.text,
      "address": address.text,
      "email": email.text,
      "phoneNumber": phoneNumber.text,
      "zipCode": zipCode.text,
      "dateOfBirth": dateOfBirth.text,
      "gender": radioGenderValue,
      "state": selectedStateItem,
      "relation": selectedReletionItem,
    };

    return basicDetailsMap;
  }

  setBasicDetails(List<Map<String, dynamic>> result) {
    firstName.text = result[0]['firstName'];
    lastName.text = result[0]['lastName'];
    designation.text = result[0]['designation'];
    address.text = result[0]['address'];
    email.text = result[0]['email'];
    phoneNumber.text = result[0]['phoneNumber'];
    zipCode.text = result[0]['zipCode'];
    dateOfBirth.text = result[0]['dateOfBirth'];
    radioGenderValue = result[0]['gender'];
    selectedStateItem = result[0]['state'];
    selectedReletionItem = result[0]['relation'];
    id = result[0]['id'];
  }
}
