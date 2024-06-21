import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../lib/validation_function.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class WorkExperince extends StatelessWidget {
  const WorkExperince({super.key});

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
                        "Work Experience",
                        style: TextStyle(color: Colors.grey, fontSize: 24),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.formDataModel.workExperienceList.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              DottedBorder(
                                color: const Color.fromRGBO(116, 103, 183, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormFiledWidget(
                                        controller: state.formDataModel.workExperienceList.data[index].companyName,
                                        lable: "Company Name",
                                        format: [
                                          FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                                        ],
                                        hint: "eSparkBiz",
                                        checkValidation: (value) {
                                          return Validation.requiredFiled(value);
                                        },
                                      ), //firstname
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormFiledWidget(
                                        controller: state.formDataModel.workExperienceList.data[index].designation,
                                        lable: "Designation",
                                        format: [
                                          FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                                        ],
                                        hint: "Manager",
                                        checkValidation: (value) {
                                          return Validation.requiredFiled(value);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("From :"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            readOnly: true,
                                            controller: state.formDataModel.workExperienceList.data[index].fromDate,
                                            onTap: () async {
                                              DateTime? date1 = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2025),
                                              );

                                              state.formDataModel.workExperienceList.data[index].fromDate.text =
                                                  DateFormat('MM/dd/yyy').format(date1!);
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: const Icon(Icons.calendar_month),
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
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("To :"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            readOnly: true,
                                            controller: state.formDataModel.workExperienceList.data[index].toDate,
                                            onTap: () async {
                                              DateTime? date1 = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2025),
                                              );

                                              state.formDataModel.workExperienceList.data[index].toDate.text =
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              index == state.formDataModel.workExperienceList.data.length - 1
                                  ? Row(
                                      children: [
                                        const Text("Add"),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<HomeBloc>(context).add(HomeAddWorkExperienceEvent());
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outline_outlined,
                                          ),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        const Text("Remove"),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<HomeBloc>(context)
                                                .add(HomeRemoveWorkExperienceEvent(index: index));
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                        )
                                      ],
                                    )
                            ],
                          );
                        })
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
