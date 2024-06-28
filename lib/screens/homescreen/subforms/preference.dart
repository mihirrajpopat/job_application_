import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../lib/validation_function.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class Preference extends StatelessWidget {
  var city = ["Gujrat", "rajsthan"];
  var relationship = ["Single", "merried"];

  Preference({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Form(
          child: Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Preferences",
                        style: TextStyle(color: Colors.grey, fontSize: 24),
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            TextFormFiledWidget(
                              controller: state.formDataModel.preferedModel.noticePeriod,
                              lable: "Notice Period",
                              hint: "1 Month",
                              checkValidation: (value) {
                                return Validation.requiredFiled(value);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFiledWidget(
                              controller: state.formDataModel.preferedModel.expectedCtc,
                              lable: "Expected CTC",
                              hint: "Enter LPA",
                              type: TextInputType.number,
                              maxLength: 6,
                              checkValidation: (value) {
                                return Validation.requiredFiled(value);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFiledWidget(
                              controller: state.formDataModel.preferedModel.currentCtc,
                              lable: "Current Ctc",
                              hint: "Enter LPA",
                              type: TextInputType.number,
                              maxLength: 6,
                              checkValidation: (value) {
                                return Validation.requiredFiled(value);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 40,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 110,
                                child: Text("Preferd location"),
                              ),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  padding: EdgeInsets.zero,
                                  value: state.formDataModel.preferedModel.selectedPreferedLocation,
                                  onChanged: (String? value) {
                                    state.formDataModel.basicDetailModel.selectedStateItem = value!;
                                  },
                                  decoration: InputDecoration(
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
                                        width: 0.5,
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(width: 0.1, color: Colors.grey),
                                    ),
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 110,
                                child: Text("Department"),
                              ),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  padding: EdgeInsets.zero,
                                  value: state.formDataModel.preferedModel.department,
                                  onChanged: (String? value) {
                                    state.formDataModel.basicDetailModel.selectedReletionItem = value!;
                                  },
                                  decoration: InputDecoration(
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
                                        width: 0.5,
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(width: 0.1, color: Colors.grey),
                                    ),
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
