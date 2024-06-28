import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../lib/validation_function.dart';
import '../../../models/reference_model.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class ReferenceContact extends StatefulWidget {
  ReferenceContact({super.key});

  @override
  State<ReferenceContact> createState() => _ReferenceContactState();
}

class _ReferenceContactState extends State<ReferenceContact> {
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
                        "Reference Contact",
                        style: TextStyle(color: Colors.grey, fontSize: 24),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.formDataModel.referenceModelList.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Remove"),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context).add(HomeRemoveReferenceEvent(index: index));

                                      if (state.formDataModel.referenceModelList.data[index].id != 1) {
                                        state.formDataModel.referenceModelList.deleted
                                            .add(state.formDataModel.referenceModelList.data[index].id);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                  )
                                ],
                              ),
                              DottedBorder(
                                color: const Color.fromRGBO(116, 103, 183, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      TextFormFiledWidget(
                                        controller: state.formDataModel.referenceModelList.data[index].name,
                                        lable: "Name",
                                        checkValidation: (value) {
                                          return Validation.requiredFiled(value);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormFiledWidget(
                                        type: TextInputType.number,
                                        controller: state.formDataModel.referenceModelList.data[index].contactNumber,
                                        lable: "Contect Number",
                                        checkValidation: (value) {
                                          return Validation.phoneValidate(value);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormFiledWidget(
                                        controller: state.formDataModel.referenceModelList.data[index].relation,
                                        lable: "Relation",
                                        checkValidation: (value) {
                                          return Validation.requiredFiled(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    state.formDataModel.referenceModelList.data.length == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Add New Reference"),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<HomeBloc>(context).add(HomeAddReferenceEvent());
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline_outlined,
                                ),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              const Text("Add"),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<HomeBloc>(context).add(HomeAddReferenceEvent());
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline_outlined,
                                ),
                              )
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
