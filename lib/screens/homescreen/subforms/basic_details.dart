import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:job_application_block/screens/homescreen/block/home_bloc.dart';
import 'package:job_application_block/screens/homescreen/block/home_event.dart';
import 'package:job_application_block/screens/homescreen/block/home_state.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../lib/validation_function.dart';
import '../../../models/checkbox_item.dart';

class BasicDetails extends StatefulWidget {
  BasicDetails({
    super.key,
  });

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  TextEditingController mealDate = TextEditingController();

  var city = ["Gujrat", "Rajsthan"];
  var relationship = ["Single", "Merried"];

  List<CheckboxItem> fList = [
    CheckboxItem(
      index: 1,
      name: "Male",
    ),
    CheckboxItem(
      index: 2,
      name: "Female",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Basic Detail",
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFiledWidget(
                          controller: state.formDataModel.basicDetailModel.firstName,
                          lable: "First Name",
                          hint: "Enter Your Name",
                          format: [
                            FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                          ],
                          checkValidation: (value) {
                            return Validation.requiredFiled(value);
                          },
                        ), //firstname
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFiledWidget(
                          controller: state.formDataModel.basicDetailModel.lastName,
                          lable: "Last Name",
                          hint: "Enter Last Name",
                          format: [
                            FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                          ],
                          checkValidation: (value) {
                            return Validation.requiredFiled(value);
                          },
                        ), //lastname
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFiledWidget(
                          controller: state.formDataModel.basicDetailModel.designation,
                          lable: "Designation",
                          format: [
                            FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                          ],
                          hint: "Devloper",
                        ), //designation
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(207, 207, 207, 0.9),
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      maxLines: 6,
                                      cursorColor: Colors.grey,
                                      controller: state.formDataModel.basicDetailModel.address,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Gaytrinagr Bhavnagar",
                                        hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
                                        contentPadding: const EdgeInsets.only(left: 20),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            width: 1,
                                            color: Colors.red,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(0, 0, 0, 0.03),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFiledWidget(
                          controller: state.formDataModel.basicDetailModel.email,
                          lable: "Email",
                          hint: "Enter Your Email",
                          checkValidation: (value) {
                            return Validation.emailValidate(value);
                          },
                        ), //email
                        const SizedBox(
                          height: 10,
                        ),
                        //city
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFiledWidget(
                          controller: state.formDataModel.basicDetailModel.phoneNumber,
                          lable: "Phone Number",
                          maxLength: 10,
                          type: TextInputType.phone,
                          hint: "Enter Your Mobile Number",
                          checkValidation: (value) {
                            return Validation.phoneValidate(value);
                          },
                        ), // phone number
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFiledWidget(
                          controller: state.formDataModel.basicDetailModel.zipCode,
                          hint: "364001",
                          type: TextInputType.phone,
                          maxLength: 6,
                          lable: "Zip Code",
                        ), //Zip

                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            const Text("Gender"),
                            Expanded(
                              child: Row(
                                children: fList
                                    .map((data) => Container(
                                          width: 100,
                                          child: RadioListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text("${data.name}"),
                                            visualDensity: const VisualDensity(
                                              horizontal: VisualDensity.minimumDensity,
                                              vertical: VisualDensity.minimumDensity,
                                            ),
                                            groupValue: state.formDataModel.basicDetailModel.grpId,
                                            dense: true,
                                            value: data.index,
                                            onChanged: (val) {
                                              BlocProvider.of<HomeBloc>(context).add(HomeChangeGenderEvent(
                                                  grpid: data.index!, radioGenderValue: data.name!));
                                            },
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Date of birth :"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(207, 207, 207, 0.9),
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: TextField(
                                readOnly: true,
                                controller: state.formDataModel.basicDetailModel.dateOfBirth,
                                onTap: () async {
                                  DateTime? date1 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                  );

                                  state.formDataModel.basicDetailModel.dateOfBirth.text =
                                      DateFormat('MM/dd/yyy').format(date1!);
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_month),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "DD/MM/YYY",
                                  hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
                                  contentPadding: const EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 0.03),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(width: 0.1, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("State"),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(207, 207, 207, 0.9),
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<String>(
                                padding: EdgeInsets.zero,
                                value: state.formDataModel.basicDetailModel.selectedStateItem,
                                onChanged: (String? value) {
                                  state.formDataModel.basicDetailModel.selectedStateItem = value!;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                                items: city.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(value),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Relation"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(207, 207, 207, 0.9),
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<String>(
                                padding: EdgeInsets.zero,
                                value: state.formDataModel.basicDetailModel.selectedReletionItem,
                                onChanged: (String? value) {
                                  state.formDataModel.basicDetailModel.selectedReletionItem = value!;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                                items: relationship.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(value),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
