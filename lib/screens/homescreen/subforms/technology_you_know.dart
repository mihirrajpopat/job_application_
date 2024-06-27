import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application_block/constants/color.dart';

import '../../../lib/textformfiled_widget.dart';
import '../../../models/checkbox_item.dart';
import '../block/home_bloc.dart';
import '../block/home_event.dart';
import '../block/home_state.dart';

class TechnologyYouKnow extends StatelessWidget {
  TechnologyYouKnow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Technology Known",
                  style: TextStyle(color: Colors.grey, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.formDataModel.technologyModelList.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          if (state.formDataModel.technologyModelList.data.length > 1) ...[
                            Row(
                              children: [
                                const Text("Remove"),
                                IconButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(HomeRemoveLanguageEvent(index: index));
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                  ),
                                )
                              ],
                            )
                          ],
                          DottedBorder(
                            color: CommonColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child:
                                        Text("${state.formDataModel.technologyModelList.data[index].techonologyName}"),
                                  ),
                                  Container(
                                    width: 30,
                                    child: Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      groupValue: state.formDataModel.technologyModelList.data[index].know,
                                      value: "Beginer",
                                      onChanged: (val) {
                                        BlocProvider.of<HomeBloc>(context).add(
                                            HomeChangeGenderEventEducation(index: index, radioValue: val.toString()));
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    child: Text("Beginer"),
                                  ),
                                  Container(
                                    width: 30,
                                    child: Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      groupValue: state.formDataModel.technologyModelList.data[index].know,
                                      value: "mediator",
                                      onChanged: (val) {
                                        BlocProvider.of<HomeBloc>(context).add(
                                            HomeChangeGenderEventEducation(index: index, radioValue: val.toString()));
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 66,
                                    child: Text("Meadiator"),
                                  ),
                                  Container(
                                    width: 30,
                                    child: Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      groupValue: state.formDataModel.technologyModelList.data[index].know,
                                      value: "Export",
                                      onChanged: (val) {
                                        BlocProvider.of<HomeBloc>(context).add(
                                            HomeChangeGenderEventEducation(index: index, radioValue: val.toString()));
                                      },
                                    ),
                                  ),
                                  Text("Export"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const Text("Add"),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                child: AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormFiledWidget(
                                        controller: context.read<HomeBloc>().technologyController,
                                        lable: "Add Technology",
                                        hint: "Java",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<HomeBloc>().add(HomeAddTechnologyEvent());
                                          Navigator.pop(context);
                                        },
                                        child: const Text("ADD"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
