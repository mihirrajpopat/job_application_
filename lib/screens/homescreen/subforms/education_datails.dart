import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application_block/screens/homescreen/block/home_event.dart';

import '../../../lib/maxlimitnumber.dart';
import '../../../lib/textformfiled_widget.dart';
import '../../../lib/validation_function.dart';
import '../block/home_bloc.dart';
import '../block/home_state.dart';

class EducationDatails extends StatelessWidget {
  const EducationDatails({super.key});

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
                        "Education Detail",
                        style: TextStyle(color: Colors.grey, fontSize: 24),
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.formDataModel.educationModel.educationModelList.length,
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
                                        controller:
                                            state.formDataModel.educationModel.educationModelList[index].nameOfBoard,
                                        lable: "Name Of Board",
                                        hint: "GSHEB",
                                        checkValidation: (value) {
                                          return Validation.requiredFiled(value);
                                        },
                                      ), //firstname
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormFiledWidget(
                                        controller:
                                            state.formDataModel.educationModel.educationModelList[index].passingYear,
                                        lable: "Passing Year",
                                        format: [
                                          DateTextFormatter(),
                                        ],
                                        type: TextInputType.number,
                                        hint: "2018",
                                        checkValidation: (value) {
                                          return Validation.requiredFiled(value);
                                        },
                                        maxLength: 4,
                                      ), //lastname
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormFiledWidget(
                                        controller:
                                            state.formDataModel.educationModel.educationModelList[index].percentage,
                                        lable: "Percentage",
                                        type: TextInputType.number,
                                        maxLength: 3,
                                        format: [
                                          // Other formatters
                                          NumericRangeFormatter(min: 1, max: 100),
                                        ],
                                        hint: "69",
                                      ), //designation
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              index == state.formDataModel.educationModel.educationModelList.length - 1
                                  ? Row(
                                      children: [
                                        const Text("Add"),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<HomeBloc>(context).add(HomeAddEducationEvent());
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
                                                .add(HomeRemoveEducationEvent(index: index));
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
