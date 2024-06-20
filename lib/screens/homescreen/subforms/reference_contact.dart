import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../lib/validation_function.dart';
import '../../../models/reference_model.dart';

class ReferenceContact extends StatefulWidget {
  ReferenceContact({super.key});

  @override
  State<ReferenceContact> createState() => _ReferenceContactState();
}

class _ReferenceContactState extends State<ReferenceContact> {
  ReferenceModelList referenceModelList = ReferenceModelList(data: [ReferenceModel()]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "References",
            style: TextStyle(color: Colors.grey, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: referenceModelList.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    DottedBorder(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            TextFormFiledWidget(
                              lable: "Name",
                              checkValidation: (value) {
                                return Validation.requiredFiled(value);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFiledWidget(
                              lable: "Contect Number",
                              checkValidation: (value) {
                                return Validation.requiredFiled(value);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFiledWidget(
                              lable: "Relation",
                              checkValidation: (value) {
                                return Validation.requiredFiled(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    index == referenceModelList.data.length - 1
                        ? Row(
                            children: [
                              Text("Add"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {});
                                    referenceModelList.data.add(ReferenceModel());
                                  },
                                  icon: Icon(Icons.add)),
                            ],
                          )
                        : Row(
                            children: [
                              const Text("Remove"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {});
                                    referenceModelList.data.removeAt(index);
                                  },
                                  icon: Icon(Icons.remove)),
                            ],
                          )
                  ],
                );
              }),
        ),
      ],
    );
  }
}
